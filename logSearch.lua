-- Define a command that accepts a character name as an argument
SLASH_LOGS1 = "/logs"
SlashCmdList["LOGS"] = function(msg)
  local characterName = msg

  -- Construct the API endpoint URL
  local url = "https://wowndde.huzy.net/api/logs/character-rank?characterName=" .. characterName

  -- Send a HTTP request to the API endpoint
  local response = SendHTTPRequest(url)

  -- Parse the JSON response
  local data = json.decode(response)

  -- response.data.characterData.character.zoneRankings.bestPerformanceAverage

  -- Extract the character's Warcraftlogs score
  local score = 0
  if data["characterData"]["character"]["zoneRankings"]["bestPerformanceAverage"] then
    score = data["characterData"]["character"]["zoneRankings"]["bestPerformanceAverage"]
  end

  -- Display the score to the user
  if score > 0 then
    print(characterName .. "의 현재 점수는 " .. score.format("%g",string.format("%.1f",v)) .. "점 입니다.")
  else
    print(characterName .. "에 대한 로그를 찾을 수 없어요.")
  end
end
