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

local bg = {}

local isInitialized = false

function bg:init()
	bg.contentHeight = 0 -- height of the content area (excludes top and bottom tiles)
	bg.size = {}
	bg.size.width = 0
	bg.size.height = 0
	bg.posX = 0
	bg.posY = 0
	
    bg.scale = {}
    bg.scale.x = 1.0
    bg.scale.y = 1.0

    bg.img = {}
    bg.img.path = 'layouts/test.png'
    bg.img.size = {}
    bg.img.size.x = 100
    bg.img.size.y = 100

	bg.underlay = utils:createImage(bg.img, bg.scale)
	
	isInitialized = true
end

function bg:dispose()
	utils:log('Disposing bg')
	isInitialized = false

	self.underlay:dispose()
end

function bg:pos(x, y)
	self.posX = x
	self.posY = y

	self.underlay:pos(x, y)
end

function bg:show()
	if not isInitialized then return end
	
	self.underlay:show()
end

function bg:hide()
	if not isInitialized then return end

	self.underlay:hide()
end

return bg