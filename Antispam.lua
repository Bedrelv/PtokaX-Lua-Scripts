----------------------------------------------
---- infobedre@gmail.com ---------------------
----------------------------------------------
-------------- PtokaX Scripts For Yout Hub ---
----------------------------------------------
----- Antispam script ------------------------
----------------------------------------------

local sBot = "#OpChat"
local bot_reg = 0      -- Bot is registeres on userlist? No - 0; Yes - 1 (Default : 0)
local ban_time = 20      -- Temporaly Ban minutes (Default : 20)
local op_info = 1      -- Info for OPs, Admins? No - 0; Yes - 1 (Default : 1)

local tProfiles = {      -- Profiles of PtokaX
   [0] = 1,      -- Owner
   [1] = 1,      -- SuperUser
   [2] = 1,      -- Master
   [3] = 1,      -- Operator
   [4] = 1,      -- VIP
   [5] = 0,      -- Reg
  [-1] = 0,      -- Guest
}

local block_all_mode = 0
local block_pm_mode = 0

local forbidden_patterns_all = {      -- Antispam Phrases Main Chat And Private Chat
  '%d+%.%d+%.%d+%.%d+',
  '(prv kaisa)',
  '­',
  ':4012',
  ':411',
  ':412',
  '000space',
  '3dn',
  '4realhost',
  '500mb.net',
  'adc:/',
  'advbt',
  'alekstu-la',
  'alfa-st',
  'amx-cs',
  'asuras',
  'badandnau',
  'banigratispoker',
  'boomtime',
  'burzs.',
  'bux.',
  'byexpand',
  'calislv',
  'cinemanet',
  'clanbb',
  'coolgirls',
  'daymusic',
  'dchub',
  'dconnect.',
  'ddns',
  'do.am',
  'domoney',
  'donkeymails',
  'dstrike',
  'dvd.idle',
  'dyn-o-saur',
  'e-aidzis7.',
  'epac.',
  'ereality.',
  'erotichub',
  'extrapussy',
  'fano.lv',
  'filebase.lv',
  'freedomhub',
  'gaveikashop',
  'getmyip.',
  'girls-now',
  'goban.',
  'hacker.lv',
  'haddan.',
  'halt.oo',
  'homeip.',
  'homelinux.',
  'hopto',
  'hubgame.',
  'icquin',
  'ilva.lv',
  'impuls-host',
  'independent-zo',
  'infopedia.',
  'infozweb.',
  'kernek.',
  '.us',
  'lathost',
  'listen.',
  'livebestbod',
  'losli.',
  'losprm',
  'lostworlds.lv',
  'maxim.oo',
  'mc1net.',
  'meendo',
  'metalserver',
  'mghub',
  'mib.ax',
  'musurekl',
  'mydyn.',
  'myminicity',
  'narod.',
  'nethacker',
  'netlink.',
  'njoyx.',
  'nobody',
  'no-ip',
  'oldnetwar',
  'otherworld',
  'phhub',
  'pivosik',
  'pl-hell',
  'polymorf',
  'real-girls',
  'reclicker',
  'redzonecam',
  'richcow',
  'ro/',
  'ruclicks',
  'russianfem',
  'serveblog',
  'serveftp',
  'shared.lv',
  'sharezone',
  'sissyslut',
  'spesialplace',
  'stancamantuir',
  'streetgangster',
  'sytes.net',
  'te-home',
  'trinity',
  'ucoz.',
  'vceti',
  'volga-hub',
  'weed.my',
  'xak2.',
  'x-hub',
}
local forbidden_patterns_pm = {      -- Spam Phrases in PM
  '%d+%.%d+%.%d+%.%d+',
  '(prv kaisa)',
  '­',
  ':4012',
  ':411',
  ':412',
  '000space',
  '3dn',
  '4realhost',
  '500mb.net',
  'adc:/',
  'advbt',
  'alekstu-la',
  'alfa-st',
  'amx-cs',
  'asuras',
  'badandnau',
  'banigratispoker',
  'boomtime',
  'burzs.',
  'bux.',
  'byexpand',
  'calislv',
  'cinemanet',
  'clanbb',
  'coolgirls',
  'daymusic',
  'dchub',
  'dconnect.',
  'ddns',
  'do.am',
  'domoney',
  'donkeymails',
  'dstrike',
  'dvd.idle',
  'dyn-o-saur',
  'e-aidzis7.',
  'epac.',
  'ereality.',
  'erotichub',
  'extrapussy',
  'fano.lv',
  'filebase.lv',
  'freedomhub',
  'gaveikashop',
  'getmyip.',
  'girls-now',
  'goban.',
  'hacker.lv',
  'haddan.',
  'halt.oo',
  'homeip.',
  'homelinux.',
  'hopto',
  'hubgame.',
  'icquin',
  'ilva.lv',
  'impuls-host',
  'independent-zo',
  'infopedia.',
  'infozweb.',
  'kernek.',
  'lathost',
  'listen.',
  'livebestbod',
  'losli.',
  'losprm',
  'lostworlds.lv',
  'maxim.oo',
  'mc1net.',
  'meendo',
  'metalserver',
  'mghub',
  'mib.ax',
  'musurekl',
  'mydyn.',
  'myminicity',
  'narod.',
  'nethacker',
  'netlink.',
  'njoyx.',
  'nobody',
  'no-ip',
  'oldnetwar',
  'otherworld',
  'phhub',
  'pivosik',
  'pl-hell',
  'polymorf',
  'real-girls',
  'reclicker',
  'redzonecam',
  'richcow',
  'ro/',
  'ruclicks',
  'russianfem',
  'serveblog',
  'serveftp',
  'shared.lv',
  'sharezone',
  'sissyslut',
  'spesialplace',
  'stancamantuir',
  'streetgangster',
  'sytes.net',
  'te-home',
  'trinity',
  'ucoz.',
  'vceti',
  'volga-hub',
  'weed.my',
  'xak2.',
  'x-hub',
}
local allowed_patterns_all = {      -- Allow phrases
  'dchub://yourhubaddress.com',
  'dchub://friendhub',
  'dchub://friendhub.com2',
}
local allowed_patterns_pm = {      -- Allow phrases in PM
  'dchub://yourhubaddress.com',
  'dchub://friendhub',
  'dchub://friendhub.com2',
}

local block_message = {      -- Messages
	"Spam!",
	"Spam! Ban on ",
	"Spam! Disconnect from hub.",
	"   write in main chat:   ",
	"   write in private message:   ",
}
---Code---DONT EDIT ANYTHING-------------

function OnStartup()
	if bot_reg==1 then
		Core.RegBot(sBot,"","",true)
	end
end


local function lower_cp1251(string_)
	local old_locale = os.setlocale()
	os.setlocale('ru_RU.cp1251')
	string_ = string_:lower()
	os.setlocale(old_locale)
	return string_
end

local function gfind_patterns(string_, patterns)
	return coroutine.wrap(function ()
		for _, pattern in ipairs(patterns) do
			local i = 1
			while true do
				local results = {string_:find(pattern, i)}
				if not results[1] then
					break
				end
				i = results[2] + 1
				coroutine.yield(unpack(results))
			end
		end
	end)
end


local function collect_results(iterator)
	local all_results = {}
	while true do
		local results = {iterator()}
		if not results[1] then
			break
		end
		table.insert(all_results, results)
	end
	return all_results
end


local function is_forbidden(message, forbidden_patterns_all, allowed_patterns_all)
	local allowed_indexes = collect_results(gfind_patterns(message, allowed_patterns_all))

	for i, j in gfind_patterns(message, forbidden_patterns_all) do
		local forbid = true
		for _, indexes in ipairs(allowed_indexes) do
			if i >= indexes[1] and j <= indexes[2] then
				forbid = false
				break
			end
		end
		if forbid then
			return true
		end
	end

	return false
end

local function is_forbidden(message, forbidden_patterns_pm, allowed_patterns_pm)
	local allowed_indexes = collect_results(gfind_patterns(message, allowed_patterns_pm))

	for i, j in gfind_patterns(message, forbidden_patterns_pm) do
		local forbid = true
		for _, indexes in ipairs(allowed_indexes) do
			if i >= indexes[1] and j <= indexes[2] then
				forbid = false
				break
			end
		end
		if forbid then
			return true
		end
	end

	return false
end

function ChatArrival(user,data)
	Core.GetUserAllData(user)
  local message = data:match('%b<>%s*(.+)|$')
  if message then
    if tProfiles[user.iProfile]==0 then
      message = lower_cp1251(message)
        if is_forbidden(message, forbidden_patterns_all, allowed_patterns_all) then
          if op_info==1 then
            Core.SendPmToOps(sBot, ("***   %s   no IP: %s %s %s"):format(user.sNick, user.sIP, block_message[4], message))
          end
          if block_all_mode==0 then
            Core.SendToUser(user,'<'..sBot..'> *** '..block_message[2]..ban_time.." min.")
            BanMan.TempBan(user,ban_time,"","",false)
              return true
          end
          if block_all_mode==1 then
            Core.SendToUser(user,'<'..sBot..'> *** '..block_message[3])
            Core.Disconnect(user)
              return true
          end
          if block_all_mode==2 then
            Core.SendToUser(user, '<' .. sBot .. '> *** ' .. block_message[1] .. '|')
              return true
          end
          if block_all_mode==3 then
            Core.SendToUser(user, ("<%s> %s"):format(user.sNick, message))    
              return true
          end
        end
      end
    end
  return false
end

function ToArrival(user,data)
	Core.GetUserAllData(user)
	local message = data:match('%b<>%s*(.+)|$')
	if message then
    if tProfiles[user.iProfile]==0 then
      message = lower_cp1251(message)
        if is_forbidden(message, forbidden_patterns_pm, allowed_patterns_pm) then
          if op_info==1 then
            Core.SendPmToOps(sBot, ("***   %s   no IP: %s %s %s"):format(user.sNick, user.sIP, block_message[5], message))
          end
          if block_pm_mode==0 then
            Core.SendToUser(user,'<'..sBot..'> *** '..block_message[2]..ban_time.." min.")
            BanMan.TempBan(user,ban_time,"","",false)
              return true
          end
          if block_pm_mode==1 then
            Core.SendToUser(user,'<'..sBot..'> *** '..block_message[3])
            Core.Disconnect(user)
              return true
          end
          if block_pm_mode==2 then
            Core.SendPmToUser(user, sBot,' *** '..block_message[1] .. '|')
              return true
          end
          if block_pm_mode==3 then
            return true
          end
        end
      end
    end
  return false
end
