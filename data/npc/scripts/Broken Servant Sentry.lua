local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()				npcHandler:onThink()					end

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end
	local player = Player(cid)

	if msgcontains(msg, "slime mould") or msgcontains(msg, "fungus") or msgcontains(msg, "sample") then
		npcHandler:say("If. You. Bring. Slime. Fungus. Samples. Fro-Fro-Fro-Frrrr*chhhhchrk*From. Other. Tower. You. Must. Be. The. Master. Are. You. There. Master?", cid)
		npcHandler.topic[cid] = 2
	elseif msgcontains(msg, "yes") then
		if npcHandler.topic[cid] == 2 then
			npcHandler:say("I. Greet. You. Ma-Ma-Ma-ster! Did. You. Bring. Mo-Mo-Mo-M*chhhhrrrk*ore. Samples. For. Me. To-To-To. Analyse-lyse-lyse?", cid)
			npcHandler.topic[cid] = 3
		elseif npcHandler.topic[cid] == 3 then
			if player:hasOutfit(433) or player:hasOutfit(432) then
				npcHandler:say("You already have this outfit.", cid)
			else
				if player:removeItem(13758, 20) then
					player:addOutfit(433)
					player:addOutfit(432)
					player:getPosition():sendMagicEffect(CONST_ME_MAGIC_GREEN)
					npcHandler:say("Thank. I. Will. Start. Analysing. No-No-No-No*chhrrrk*Now.", cid)
					npcHandler.topic[cid] = 0					
				end
			end
		end
	end
	return true
end

npcHandler:setMessage(MESSAGE_GREET, "The Master is-is-is-is de-ad. Plea*chrrrrchk*se. Be. In. Mourning.")
npcHandler:setMessage(MESSAGE_FAREWELL, "Always be on guard, |PLAYERNAME|!")
npcHandler:setMessage(MESSAGE_WALKAWAY, "This ungraceful haste is most suspicious!")

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
