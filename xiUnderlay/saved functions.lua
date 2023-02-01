
windower.register_event('addon command', function(...)
    local args = T{...}
    local command
    if args[1] then
        command = string.lower(args[1])
    end

    if command == 'show' then
        if isInitialized then return end
        init()
    elseif command == 'hide' then
        if not isInitialized then return end
        hide()
    end
end)

local size = {}
local img = {}
img.__index = img

function init()
    windower.add_to_chat(220, windower.addon_path .. 'layouts/test.png')
    image = imgCreate(windower.addon_path .. 'layouts/test.png', 100, 100, 1.0, 1.0)
    isInitialized = true
    isLoaded = true
    return image
end

function hide()
    dispose()
    isInitialized = false
    isLoaded = false
end

function imgCreate(path, width, height, scaleX, scaleY)
    local obj = {}
    setmetatable(obj, img)

    obj.data = {}
    obj.data.alpha = 255
    obj.data.opacity = 1.0
    obj.data.path = path
    obj.data.pos = {}
    obj.data.pos.x = 0
    obj.data.pos.y = 0
    obj.data.scale = {}
    obj.data.scale.x = scaleX
    obj.data.scale.y = scaleY
    obj.data.size = {}
    obj.data.size.width = width
    obj.data.size.height = width
    obj.data.scaleSize = {}
    obj.data.scaleSize.width = width * scaleX
    obj.data.scaleSize.height = width * scaleY

    obj.image = images.new()
    obj.image:draggable(true)
    obj.image:fit(false)

    if path then
        obj.image:path(path)
    end
-- There is a problem here with method "size" being a nil value???!
	  obj:size(width, height)

    return obj
end

function dsipose()
    images.destroy(self.image)    
    setmetatable(self, nil)
end
