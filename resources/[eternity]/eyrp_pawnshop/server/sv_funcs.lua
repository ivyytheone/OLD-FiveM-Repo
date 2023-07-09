SendToDiscord = function(discordMessage)
    local embeds = {
        {
            ["type"] = "rich",
            ["color"] = 56108,
            ["title"] = GetPlayerName(source),
            ["description"] = discordMessage,  
            ['footer'] = {
                ['text'] = "\nEYRP ADMIN LOG: " .. os.date()
            }
        }
    }
	PerformHttpRequest('https://discord.com/api/webhooks/861014621090349066/rSihpsBbTFgU6maYP-hjFT3HTYrLtGZrFiUGANbJde-0njAFE2ib9R2cps1lDScohPYU', function(err, text, headers) end, 'POST', json.encode({username = "Eternity - Pantbutik", embeds = embeds}), { ['Content-Type'] = 'application/json' })
end