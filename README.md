## Support for notice option in redirect_to

To handle and display notice message from redirect you have to implement
your own JS method `turbolinksNotice(message)`. This method will
be called just before `Turbolinks.visit`.

The simplest example of that method looks like this:
```
this.turbolinksNotice = (message) ->
  alert(message)
```

IMPORTANT: The body content will be replaced by turbolinks as a result of
`Turbolinks.visit` call so you should store the message in JS variable
and display it in `turbolinks:load` event handler
