Loads the settings or creates the file if it doesnt not exist then loads settings. To be honest we can skip this part for now to get a working concept and the come back to this later.
```
function settings:load(create, enable)
    local wasJobEnabled = settings.jobEnabled

    globalSettings = config.load(defaults)
    jobSettings = nil
    settings.jobEnabled = false

    self:copy(globalSettings, settings, defaults)

    local job = windower.ffxi.get_player().main_job
    if job then
        local jobFilePath = 'data/' .. string.lower(job) .. '.xml'
        local fullJobFilePath = windower.addon_path .. jobFilePath

        local exists = windower.file_exists(fullJobFilePath)
        if create or exists then
            local js = config.load(jobFilePath, jobDefaults)

            if not js.jobEnabled and enable then
                js.jobEnabled = true
                js:save()
            end

            if js.jobEnabled then
                jobSettings = js
                settings.jobEnabled = true
                currentJob = job

                if create and not exists then
                    self:copy(settings, jobSettings, jobDefaults)
                    jobSettings:save()
                    log('Created job settings for ' .. job .. ' and copied global settings.')
                else
                    self:copy(jobSettings, settings, jobDefaults) -- load job settings
                    log('Loaded job settings for ' .. job .. '.')
                end
            end
        end
    end
    if wasJobEnabled and not settings.jobEnabled then
        log('Global settings applied.')
    end
    self:loadFilters()
end
```
