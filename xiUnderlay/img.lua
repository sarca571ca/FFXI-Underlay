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

local img = {}
img.__index = img

-- a wrapper class for windower image primitives with scaling support
function img:init(path, width, height, scaleX, scaleY)
	if not path then
		width = 0
		height = 0
		scale = 1.0
	elseif not width or not height then return nil
	elseif not scaleX then
		scaleX = 1.0
		scaleY = 1.0
	elseif not scaleY then -- uniform scale
		scaleY = scaleX
	end

	local obj = {}
	setmetatable(obj, img) -- make handle lookup

	-- private data fields, do not change from outside the class!
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
	obj.data.scaledSize = {}
	obj.data.scaledSize.width = width * scaleX
	obj.data.scaledSize.height = width * scaleY
	
	obj.image = images.new()
	obj.image:draggable(true)
    obj.image:fit(false) -- scaling only works when 'fit' is false
	
	if path then
		obj.image:path(path)
	end
	
	obj:size(width, height)
	
	return obj
end