```
windower.register_event('load', function()
    if windower.ffxi.get_info().logged_in then
        settings:init(model)
        settings:load()
        loadLayout(settings.layout)
        isLoaded = true
    end
end)
```

