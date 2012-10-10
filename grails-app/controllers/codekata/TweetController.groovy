package codekata

import grails.converters.JSON
import org.codehaus.jackson.map.ObjectMapper
import org.springframework.http.HttpStatus

import static org.springframework.http.HttpStatus.*
import static org.springframework.http.MediaType.APPLICATION_JSON

/**
 * Controller that handles all CRUD operations on {@link Tweet}
 *
 */
class TweetController {

    /**
     * Jackson mapper for mapping JSON -> Java
     */
    private static final ObjectMapper OBJECT_MAPPER = new ObjectMapper()

    /**
     *
     */
    static allowedMethods = [save: "POST", merge: "POST", delete: "DELETE,GET", create: "POST", add: "POST"]

    /**
     * Render start page, just delegate to view
     */
    def index() {

    }

    /**
     * Adds a new Tweet, return http status code 201 on success and 422 on validation failure
     * and a list of errors. Will use form data.
     *
     * @param tweet the tweet to add
     */
    def create() {
        saveTweet(params, CREATED)
    }

    /**
     * Adds a new Tweet, return http status code 201 on success and 422 on validation failure
     * and a list of errors. Will use JSON data
     *
     * @param tweet the tweet to add
     */
    def add() {
        saveTweet(parseJSON(), CREATED)
    }

    /**
     * Deletes a tweet, return http status code 204 on success
     *
     * @param tweet the tweet to delete
     */
    def delete(long id) {
        final tweet = Tweet.get(id)
        if(tweet){
            tweet.delete(flush: true)
            render status: NO_CONTENT
        } else {
            render status: NOT_FOUND
        }

    }

    /**
     * Updates a Tweet, return http status code 204 on success and 422 on validation failure
     * and a list of errors. Will use JSON data
     */
    def save() {
        saveTweet(parseJSON(), NO_CONTENT)

    }

    /**
     * Updates a Tweet, return http status code 204 on success and 422 on validation failure
     * and a list of errors. Will use form data
     */
    def merge() {
        saveTweet(params, NO_CONTENT)
    }

    /**
     * Parse JSON to a map
     *
     * @return the map with data from the JSON structure
     */
    private Map parseJSON() {
        final tweet = OBJECT_MAPPER.readValue(request.inputStream.text.getBytes("UTF-8"), HashMap)

        tweet
    }

    /**
     * Returns a JSON representation of all Tweets
     *
     *
     */
    def list() {
        render Tweet.list() as JSON

    }

    /**
     * Helper method that validates and saves a Tweet, return 422 on validation failure
     * and a list of errors.
     *
     * @param tweet the Tweet to create/save
     * @param httpSuccessCode the http status code to return on success
     */
    private saveTweet(props, HttpStatus httpSuccessCode) {
        def tweet = props.id > 0 ? Tweet.get(props.id) : new Tweet()

        tweet.properties = props

        if (tweet.validate()) {
            tweet.save(flush: true)
            render status: httpSuccessCode
        } else {
            def errorList = []
            tweet.errors.allErrors.each {
                errorList << [field: it.field]
            }
            render status: UNPROCESSABLE_ENTITY, text: new JSON([errors: errorList]), contentType: APPLICATION_JSON

        }
    }
}