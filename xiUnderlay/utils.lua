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

local utils = {}

-- log levels:
-- 0 ... finest
-- 1 ... fine
-- 2 ... info (default)
-- 3 ... warning
-- 4 ... error
utils.level = 3

function utils:createImage(imageInfo, scaleX, scaleY)
-- (path, x, y, scaleX, scaleY) (bg.img.path, bg.img.size.x, bg.img.size.y, bg.scale.x, bg.scale.y)
	if not scaleY then
		scaleY = scaleX
	end
	
	local size = utils:coord(imageInfo.size)
	local image = img:init(windower.addon_path .. imageInfo.path, size.x, size.y, scaleX, scaleY)
	
	return image
end

function utils:coord(coordList)
	local coord = {}
	
	if coordList then
		coord.x = coordList[1]
		coord.y = coordList[2]
	end
	
	if not coord.x then coord.x = 0 end
	if not coord.y then coord.y = 0 end
	
	return coord
end