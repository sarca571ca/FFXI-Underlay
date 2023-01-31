- Need to load settings on login.
	- Load settings
	- Load Layout
```
local isLoaded = false

function load() -- need a duplicate function to handle logging in also
	if not isLoaded then
		-- Some Log message here maybe?
		-- Load settings here but this can be skiped until we get
		-- something working
		isLoaded = true
	end
end	
```
- Need to initialize everything
```
local isInitialized = false

function init()
	if isInitialized then return end

	-- Some log message here maybe?
	-- Render the Image, simple at first then split the functions later for
	-- cleanliness.
	img:init(path, x, y, scaleX, scaleY) -- we can prob remove scale for testing
end	
```
- Rendering
```
function img:init(filePath, width, height)
	if not filePath then
		-- Log "no file at path"
		width = 0
		height = 0
	end

```