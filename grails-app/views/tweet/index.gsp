<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <title>Tweet App</title>
  <link rel="stylesheet" href="../css/base.css">
  <style>{display: none}</style>

</head>
<body>
  <section id="twets">
    <header id="header">
      <h1>Tweets</h1>
      <form id="todo-form" >
        <input id="new-todo" placeholder="Add tweet" autofocus>
      </form>
    </header>
    <section id="main">
      <ul id="todo-list">
        <li>
          <div class="view">
            <label></label>
            <button class="destroy"></button>
          </div>
          <form >
            <input class="edit">
          </form>
        </li>
      </ul>
    </section>
    <footer id="footer">
      <span id="todo-count"><strong></strong>
      </span>

    </footer>
  </section>
  <footer id="info">
    <p>Double-click to edit a tweet.</p>

  </footer>
</body>
</html>
