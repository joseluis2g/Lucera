local messages = {
    "[FORUM] Reporte bugs e concorra a premios, acesse nosso forum!",
    "[LOJA] Confira as ofertas de nossa loja, acesse http://www.vanaheimglobal.com agora mesmo.",
	"[INFO] O Vanaheim Global e um servidor que esta sempre sendo atualizado, nos estamos prontos para deixar o Tibia como voce nunca viu. Venha ser o Top."
}

function onThink(interval, lastExecution)
	local message = messages[i]
    Game.broadcastMessage(message, MESSAGE_STATUS_WARNING)
    return true
end
