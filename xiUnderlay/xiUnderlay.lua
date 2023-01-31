--[[
	Copyright © 2023, ex1L3
	All rights reserved.

	Redistribution and use in source and binary forms, with or without
	modification, are permitted provided that the following conditions are met:

		* Redistributions of source code must retain the above copyright
		  notice, this list of conditions and the following disclaimer.
		* Redistributions in binary form must reproduce the above copyright
		  notice, this list of conditions and the following disclaimer in the
		  documentation and/or other materials provided with the distribution.
		* Neither the name of xiUnderlay nor the
		  names of its contributors may be used to endorse or promote products
		  derived from this software without specific prior written permission.

	THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
	ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
	WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
	DISCLAIMED. IN NO EVENT SHALL ex1L3 BE LIABLE FOR ANY
	DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
	(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
	LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
	ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
	(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
	SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
]]

_addon.name = 'xiUnderlay'
_addon.author = 'ex1L3'
_addon.version = '1.0.0'
_addon.commands = {'xiu', 'xiunderlay'}

images = require('images')
file = require('files')

local isLoaded = false
local isInitialized = false

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

function init()
    image = img(windower.addon_path .. 'layouts/test.png', 100, 100)
    isInitialized = true
    isLoaded = true
    return image
end

function hide()
    dispose()
    isInitialized = false
    isLoaded = false
end

local img = {}
img.__index = img

function img(path, width, height, scaleX, scaleY)
    local obj = {}
    setmetatable(obj, img)

    obj.data = {}
    obj.data.alpha = 255
    obj.data.opacity = 1.0
    obj.data.path = path
    obj.data.pos = {}
    obj.data.pos.x = 0
    obj.data.pos.y = 0
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

    obj:size(width, height)

    return obj
end

function dsipose()
    images.destroy(self.image)    
    setmetatable(self, nil)
end