#define	FILTERSCRIPT
#include	a_samp
#include	pwncmd
#include	dof2

#pragma disablerecursion

public OnFilterScriptInit()
{
	if(!fexist("Perms/npc-maker.ini"))
	{
		DOF2_CreateFile("Perms/npc-maker.ini");
		DOF2_SetBool("Perms/npc-maker.ini", "LL-Admin", false, "Support");
		DOF2_SetBool("Perms/npc-maker.ini", "Your_Name", true, "Allowed");
		DOF2_SaveFile();
	}
	print("FS NPC-Maker v1 created by Otakeiro");
	return 1;
}

public OnFilterScriptExit()
{
	DOF2_Exit();
	return 1;
}

new bool:rec[100];

public OnPlayerConnect(playerid)
{
	rec[playerid] = false;
	return 1;
}

public OnPlayerDisconnect(playerid, reason)
{
	if(rec[playerid] == true) StopRecordingPlayerData(playerid);
	return 1;
}

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	if(dialogid == 1001)
	{
		if(!response)
		{
			if(!strlen(inputtext))
			{
				GameTextForPlayer(playerid, "~p~[~w~NPC-MAKER~p~]~n~~r~Gravacao Cancelada", 1500, 6);
				return 1;
			}
			StartRecordingPlayerData(playerid, 1, inputtext);
			GameTextForPlayer(playerid, "~p~[~w~NPC-MAKER~p~]~n~~g~Gravacao Iniciada", 1500, 6);
			rec[playerid] = true;
		}
		else
		{
			if(!strlen(inputtext))
			{
				GameTextForPlayer(playerid, "~p~[~w~NPC-MAKER~p~]~n~~r~Gravacao Cancelada", 1500, 6);
				return 1;
			}
			StartRecordingPlayerData(playerid, 1, inputtext);
			GameTextForPlayer(playerid, "~p~[~w~NPC-MAKER~p~]~n~~g~Gravacao Iniciada", 1500, 6);
			rec[playerid] = true;
		}
	}
	return 1;
}

CMD:npcmaker(playerid)
{
	if(rec[playerid]==true)
	{
		StopRecordingPlayerData(playerid);
		GameTextForPlayer(playerid, "~p~[~w~NPC-MAKER~p~]~n~~y~Gravacao Encerrada", 1500, 6);
		return 1;
	}
	
	if(GetPlayerPerm(playerid) == 1)
	{
		ShowPlayerDialog(playerid, 1001, 1, "{FF00FF}NPC-MAKER:\t{FFFFFF}Criando NPCs", "Insira um nome para o NPC ou deixe em branco para cancelar!\nLimite de caracteres: 4 > 16", "ONFOOT", "DRIVER");
	}
	return 1;
}

stock GetPlayerPerm(playerid)
{
	if(IsPlayerAdmin(playerid)) return 1;
	if(DOF2_GetBool("Perms/npc-maker.ini", pname(playerid), "Allowed") == true) return 1;
	if(DOF2_GetBool("Perms/npc-maker.ini", "LL-Admin", "Support") == true)
	{
		if(DOF2_GetInt("LLADMIN/Admins.adm", pname(playerid)) >= 2) return 1;
	}
	return 0;
}

stock pname(playerid)
{
	new varname[24];
	GetPlayerName(playerid, varname, sizeof(varname));
	return varname;
}
















