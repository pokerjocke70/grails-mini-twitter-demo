package codekata

/**
 * Tweet domain class
 */
class Tweet {

    /**
     * Time of creation, default to now
     */
    Date created = new Date()

    /**
     * Tweet text, 1-48 chars
     */
    String text = ""

    /**
     * Unique id
     */
    long id

    /**
     * Add constraints on text to be between 1 and 48 chars
     */
    static constraints = {
        text(blank: false, maxSize: 48)
    }

    /**
     * Add autoincrement database id
     */
    static mapping = {
        id generator: "increment"
    }

}
