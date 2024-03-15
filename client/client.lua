local ox_target = exports.ox_target
local StartJobLocation = vec3(-14.2849, 6485.2510, 31.4974)
local JobStartLocationa = lib.points.new(StartJobLocation, 20.0)


function createDarbas()
    local optionai = {
        {
            name = 'Kirpti',
            icon = 'fa-solid fa-scissors',
            label = 'Nukirpti Buda',
            onSelect = function()
                local zirklesturi = lib.callback('tizo:turizirkles', false)
                if zirklesturi then
                    lib.progressCircle({
                        duration = 10000,
                        position = 'middle',
                        useWhileDead = false,
                        canCancel = false,
                        disable = {
                            car = true,
                            move = true,
                        },
                        anim = {
                            dict = 'anim@amb@business@weed@weed_inspecting_lo_med_hi@',
                            clip = 'weed_crouch_checkingleaves_idle_03_inspectorfemale'
                        },
                        prop = {
                            model = `prop_cs_scissors`,
                            pos = vec3(0.03, 0.03, 0.02),
                            rot = vec3(1.0, 0.0, 0)
                        },
                    })
                    local item = 'burger'
                    TriggerServerEvent('tizo:finalas', item)
                else
                    lib.notify({
                        title = 'Darbas',
                        description = 'Neturi zirkliu!',
                        position = 'top',
                        style = {
                            backgroundColor = '#141517',
                            color = '#C1C2C5',
                            ['.description'] = {
                            color = '#909296'
                            }
                        },
                        icon = 'ban',
                        iconColor = '#C53030'
                    })
                end
            end
        }
    }
    ox_target:addModel(`bkr_prop_weed_lrg_01a`, optionai)
end
function createDarbasStalas()
    local optionai1 = {
        {
            name = 'Sukti',
            icon = 'fa-solid fa-joint',
            label = 'Sukti Kaseka',
            onSelect = function()
                lib.progressCircle({
                    duration = 10000,
                    position = 'middle',
                    useWhileDead = false,
                    canCancel = false,
                    disable = {
                        car = true,
                        move = true,
                    },
                    anim = {
                        dict = 'amb@prop_human_parking_meter@female@base',
                        clip = 'base_female'
                    },
                })
                local item = 'water'
                TriggerServerEvent('tizo:finalas', item)
            end
        }
    }
    ox_target:addModel(`bkr_prop_weed_table_01a`, optionai1)
end
function JobStartLocationa:onEnter()
    createDarbas()
    createDarbasStalas()
end
function JobStartLocationa:onExit()
    ox_target:removeModel(`bkr_prop_weed_lrg_01a`, optionai)
    ox_target:removeModel(`bkr_prop_weed_table_01a`, optionai1)
end