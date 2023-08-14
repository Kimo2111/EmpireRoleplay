#include <a_samp>
#include <streamer>
#include <zcmd>

#define FILTERSCRIPT

new HackerJob[MAX_PLAYERS];
new HJLimitTimer;

forward HJTimeLimit(playerid);
public HJTimeLimit(playerid)
{
    SpawnPlayer(playerid);
	ShowPlayerDialog(playerid,-1,0,"","","","");
	SetPlayerVirtualWorld(playerid, 0);
 	SetPlayerInterior(playerid,0);
	HackerJob[playerid] = 0;
	SendClientMessage(playerid,0xFF0000AA,"* Working time you're done, and you dont finish it.");
	return 1;
}
forward HackerSetup(playerid);
public HackerSetup(playerid)
{
    SetPlayerVirtualWorld(playerid, playerid+1);
    SetPlayerInterior(playerid,1);
    SetPlayerPos(playerid, 2164.7,1601.9,999.9);
	SetPlayerFacingAngle(playerid, 263.0);
	SetPlayerCameraPos(playerid, 2163.5,1601.9,1000.8);
	SetPlayerCameraLookAt(playerid, 2172.7,1601.9,999.9);
    ApplyAnimation(playerid,"INT_OFFICE","OFF_Sit_Type_Loop", 4.0, 1, 0, 0, 0, 0);
	SetTimerEx("HackerOne", 3000, 0, "d", playerid);
}

forward HackerOne(playerid);
public HackerOne(playerid)
{
    PlayerPlaySound( playerid, 1058, 0, 0, 0 );
    SetPlayerCameraLookAt(playerid, 2172.1,1601.7,999.9);
	ShowPlayerDialog(playerid, 1998, DIALOG_STYLE_INPUT, "root@localhost:~", "Login as: root\nSystem is ready to rip off an important center\nType began to launch attacks", "Submit", "Cancel");
}

forward HackerTwo(playerid);
public HackerTwo(playerid)
{
    PlayerPlaySound( playerid, 1058, 0, 0, 0 );
    ApplyAnimation(playerid, "CARRY", "crry_prtial", 2.0, 0, 0, 0, 0, 0);
    GameTextForPlayer(playerid,"~p~succeed",1000,6);
	ShowPlayerDialog(playerid, 1999, DIALOG_STYLE_INPUT, "root@localhost:~", "Login as: root\nThe system continues to the next center\nType keygen to launch attacks", "Submit", "Cancel");
}

forward HackerThree(playerid);
public HackerThree(playerid)
{
    PlayerPlaySound( playerid, 1058, 0, 0, 0 );
    GameTextForPlayer(playerid,"~p~succeed",1000,6);
	ShowPlayerDialog(playerid, 2000, DIALOG_STYLE_INPUT, "root@localhost:~", "Login as: root\nThe system continues to the next center\nType cracked to launch attacks", "Submit", "Cancel");
}
forward HackerFour(playerid);
public HackerFour(playerid)
{
    PlayerPlaySound( playerid, 1058, 0, 0, 0 );
    GameTextForPlayer(playerid,"~p~succeed",1000,6);
	ShowPlayerDialog(playerid, 2001, DIALOG_STYLE_INPUT, "root@localhost:~", "Login as: root\nThe system continues to the next center\nType worm to launch attacks", "Submit", "Cancel");
}
forward HackerFive(playerid);
public HackerFive(playerid)
{
    PlayerPlaySound( playerid, 1058, 0, 0, 0 );
    GameTextForPlayer(playerid,"~p~succeed",1000,6);
	ShowPlayerDialog(playerid, 2002, DIALOG_STYLE_INPUT, "root@localhost:~", "Login as: root\nThe system continues to the next center\nType virus to launch attacks", "Submit", "Cancel");
}

forward HackerSix(playerid);
public HackerSix(playerid)
{
    PlayerPlaySound( playerid, 1058, 0, 0, 0 );
    GameTextForPlayer(playerid,"~p~succeed",1000,6);
	ShowPlayerDialog(playerid, 2003, DIALOG_STYLE_INPUT, "root@localhost:~", "Login as: root\nThe system continues to the next center\nType trojan to launch attacks", "Submit", "Cancel");
}

forward HackerSeven(playerid);
public HackerSeven(playerid)
{
    KillTimer(HJLimitTimer);
    PlayerPlaySound( playerid, 1058, 0, 0, 0 );
    SetPlayerVirtualWorld(playerid, playerid+1);
    SetPlayerInterior(playerid,1);
    SetPlayerPos(playerid, 2164.7,1601.9,999.9);
	SetPlayerFacingAngle(playerid, 263.0);
	SetPlayerCameraPos(playerid, 2163.5,1601.9,1000.8);
	SetPlayerCameraLookAt(playerid, 2172.7,1601.9,999.9);
	ApplyAnimation(playerid,"CASINO","Roulette_win", 4.0, 1, 0, 0, 0, 0);
    GameTextForPlayer(playerid,"~p~succeed",2000,6);
	new hname[MAX_PLAYER_NAME], string[128];
    GetPlayerName(playerid, hname, sizeof(hname));
    format(string, sizeof(string), "%s have completed the job as a Hacker Job.", hname );
    SendClientMessageToAll(0x33FF33AA, string);
	SendClientMessage(playerid,0x33FF33AA,"* You have completed the job and get $110000");
    GivePlayerMoney(playerid, 110000);
    SetTimerEx("HackerSuccesed", 3000, 0, "d", playerid);

}

forward HackerSuccesed(playerid);
public HackerSuccesed(playerid)
{
    SpawnPlayer(playerid);
	SetPlayerVirtualWorld(playerid, 0);
    TogglePlayerControllable(playerid,true);
	HackerJob[playerid] = 0;
    SetPlayerInterior(playerid,0);
    return 1;
}

public OnFilterScriptInit()
{
	print("+code++++++@!^*%$#~++worm++++cracked++++");
	print("		Hacker Job - Kucin666		");
	print("+++++++trojan+++*********++++hack+++++++\n");
	
	CreatePickup(1239, 1, 1720.3076,-1740.8135,13.5469);
	CreateDynamicMapIcon(1720.3076,-1740.8135,13.5469, 23, 0);
	Create3DTextLabel("Hacker Job",0xEEEE88FF,1720.3076,-1740.8135,13.5469 +0.85,20.0,0,1);
	Create3DTextLabel("Type /hacker",0xEEEE88FF,1720.3076,-1740.8135,13.5469 +0.75,20.0,0,1);
	return 1;
}

public OnPlayerConnect(playerid)
{
    HackerJob[playerid] = 0;
    return 1;
}

public OnPlayerDisconnect(playerid,reason)
{
 	KillTimer(HJLimitTimer);
	HackerJob[playerid] = 0;
    return 1;
}

public OnPlayerDeath(playerid, killerid, reason)
{
    KillTimer(HJLimitTimer);
	HackerJob[playerid] = 0;
    return 1;
}


public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	if(HackerJob[playerid] == 1)
	{
	    if(!response)
   		{
          	SpawnPlayer(playerid);
   		    KillTimer(HJLimitTimer);
   		    ShowPlayerDialog(playerid,-1,0,"","","","");
	    	SetPlayerVirtualWorld(playerid, 0);
      		SetPlayerInterior(playerid,0);
			HackerJob[playerid] = 0;
			SendClientMessage(playerid, 0xFF0000AA, "You have failed to do the hacks.");
			return 1;
		}
	    if(dialogid == 1998)
		{
       		if(strfind(inputtext,"began") != -1)
       		{
	       		    SetPlayerVirtualWorld(playerid, playerid+1);
	       		    SetPlayerInterior(playerid,2);
	       		    SetPlayerPos(playerid, 2549.7 +2,-1297.8,1060.9);
	           		SetPlayerFacingAngle(playerid, 92.0);
		   			SetPlayerCameraPos(playerid, 2551.4,-1297.8,1062.1);
		   			SetPlayerCameraLookAt(playerid, 2549.7,-1297.8,1061);
		   			TogglePlayerControllable(playerid,false);
				 	GameTextForPlayer(playerid,"~p~rip off...",6000,6);
				 	return SetTimerEx("HackerTwo", 6000, 0, "d", playerid);
   			}
			else
			{
           			SpawnPlayer(playerid);
		   		    KillTimer(HJLimitTimer);
		   		    ShowPlayerDialog(playerid,-1,0,"","","","");
			    	SetPlayerVirtualWorld(playerid, 0);
       		 		SetPlayerInterior(playerid,0);
					HackerJob[playerid] = 0;
					SendClientMessage(playerid, 0xFF0000AA, "You have failed to do the hacks.");
					return 1;
			}
		}
	    if(dialogid == 1999)
		{
			if(strfind(inputtext,"keygen") != -1)
       		{
	       		    SetPlayerVirtualWorld(playerid, playerid+1);
	       		    SetPlayerInterior(playerid,3);
	       		    SetPlayerPos(playerid, 830.7 +2,-0.2,1004.1);
	           		SetPlayerFacingAngle(playerid, 178.9);
	  				SetPlayerCameraPos(playerid, 830.7,0.3,1005.2);
	  				SetPlayerCameraLookAt(playerid, 830.7,-0.2,1004.8);
	  				TogglePlayerControllable(playerid,false);
		 			GameTextForPlayer(playerid,"~p~rip off...",6000,6);
				 	return SetTimerEx("HackerThree", 6000, 0, "d", playerid);
  	 		}
			else
			{
           			SpawnPlayer(playerid);
		   		    KillTimer(HJLimitTimer);
		   		    ShowPlayerDialog(playerid,-1,0,"","","","");
			    	SetPlayerVirtualWorld(playerid, 0);
			    	SetPlayerInterior(playerid,0);
					HackerJob[playerid] = 0;
					SendClientMessage(playerid, 0xFF0000AA, "You have failed to do the hacks.");
					return 1;
			}
		}
	    if(dialogid == 2000)
		{
			if(strfind(inputtext,"cracked") != -1)
       		{
	       		    SetPlayerVirtualWorld(playerid, playerid+1);
	       		    SetPlayerInterior(playerid,6);
	       		    SetPlayerPos(playerid, 231.6 +2,80.3,1005.0);
	  				SetPlayerFacingAngle(playerid, 46.3);
				   	SetPlayerCameraPos(playerid, 232.7,79.4,1005.6);
				   	SetPlayerCameraLookAt(playerid, 231.6,80.3,1005.0);
				   	TogglePlayerControllable(playerid,false);
				   	GameTextForPlayer(playerid,"~p~rip off...",6000,6);
				 	return SetTimerEx("HackerFour", 6000, 0, "d", playerid);
   			}
			else
			{
           			SpawnPlayer(playerid);
		   		    KillTimer(HJLimitTimer);
		   		    ShowPlayerDialog(playerid,-1,0,"","","","");
			    	SetPlayerVirtualWorld(playerid, 0);
			    	SetPlayerInterior(playerid,0);
					HackerJob[playerid] = 0;
					SendClientMessage(playerid, 0xFF0000AA, "You have failed to do the hacks.");
					return 1;
			}
		}
	    if(dialogid == 2001)
		{
			if(strfind(inputtext,"worm") != -1)
			{
	       		    SetPlayerVirtualWorld(playerid, playerid+1);
	       		    SetPlayerInterior(playerid,2);
	       		    SetPlayerPos(playerid, 2572.1 -2,-1291.3,1037.7);
	  				SetPlayerFacingAngle(playerid, 276.5);
	  				SetPlayerCameraPos(playerid, 2571.3,-1291.3,1038.3);
	  				SetPlayerCameraLookAt(playerid, 2572.1,-1291.3,1038.4);
	  				TogglePlayerControllable(playerid,false);
	  				GameTextForPlayer(playerid,"~p~rip off...",6000,6);
				 	return SetTimerEx("HackerFive", 6000, 0, "d", playerid);
     		}
			else
			{
           			SpawnPlayer(playerid);
		   		    KillTimer(HJLimitTimer);
		   		    ShowPlayerDialog(playerid,-1,0,"","","","");
			    	SetPlayerVirtualWorld(playerid, 0);
			    	SetPlayerInterior(playerid,0);
					HackerJob[playerid] = 0;
					SendClientMessage(playerid, 0xFF0000AA, "You have failed to do the hacks.");
					return 1;
			}
		}
		if(dialogid == 2002)
		{
 			if(strfind(inputtext,"virus") != -1)
  			{
	       		    SetPlayerVirtualWorld(playerid, playerid+1);
	       		    SetPlayerInterior(playerid,2);
	       			SetPlayerPos(playerid, 2568.3 -3,-1294.6,1037.7);
 					SetPlayerFacingAngle(playerid, 207.0);
		   			SetPlayerCameraPos(playerid, 2568.0,-1293.7,1038.6);
				 	SetPlayerCameraLookAt(playerid, 2568.8,-1294.6,1038.3);
		   			TogglePlayerControllable(playerid,false);
				 	GameTextForPlayer(playerid,"~p~rip off...",6000,6);
	 				return SetTimerEx("HackerSix", 6000, 0, "d", playerid);
   			}
 			else
 			{
            		SpawnPlayer(playerid);
		   		    KillTimer(HJLimitTimer);
		   		    ShowPlayerDialog(playerid,-1,0,"","","","");
			    	SetPlayerVirtualWorld(playerid, 0);
			    	SetPlayerInterior(playerid,0);
					HackerJob[playerid] = 0;
					SendClientMessage(playerid, 0xFF0000AA, "You have failed to do the hacks.");
					return 1;
			}
		}
		if(dialogid == 2003)
		{
	  		for(new i = 0; i < strlen(inputtext); i++)
	        {
	        	if(strfind(inputtext,"trojan") != -1)
	       		{
	       		    SetPlayerVirtualWorld(playerid, playerid+1);
	       		    SetPlayerInterior(playerid,0);
	       			SetPlayerPos(playerid, 212.4 +10,1822.9,6.4);
					SetPlayerFacingAngle(playerid, 89.7);
		   			SetPlayerCameraPos(playerid, 216.4,1823.1,7.8);
		   			SetPlayerCameraLookAt(playerid, 212.4,1822.9,6.4);
		   			TogglePlayerControllable(playerid,false);
				 	GameTextForPlayer(playerid,"~p~rip off...",6000,6);
	 				return SetTimerEx("HackerSeven", 6000, 0, "d", playerid);
	     		}
    	 		else
	  			{
          			SpawnPlayer(playerid);
		   		    KillTimer(HJLimitTimer);
		   		    ShowPlayerDialog(playerid,-1,0,"","","","");
			    	SetPlayerVirtualWorld(playerid, 0);
			    	SetPlayerInterior(playerid,0);
					HackerJob[playerid] = 0;
					SendClientMessage(playerid, 0xFF0000AA, "You have failed to do the hacks.");
					return 1;
				}
	      	}
		}
	}
	return 1;
}

CMD:jobhacker(playerid, params[])
{
	if(HackerJob[playerid] == 1)
	{
	    SendClientMessage(playerid, 0xFF0000AA, "You're not allowed to use this command while working.");
	    return 1;
	}
	SetPlayerPos(playerid,1719.8445,-1733.5785,13.3828);
	SetPlayerInterior(playerid,0);
	return 1;
}

CMD:hacker(playerid, params[])
{
	if(IsPlayerInRangeOfPoint(playerid, 2, 1720.3076,-1740.8135,13.5469))
	{
        if(HackerJob[playerid] > 0)
        {
			SendClientMessage(playerid,0xFF0000AA,"You have started a Hacker Job and can't use this command.");
			return 1;
		}
		HackerJob[playerid] = 1;
		new hname[MAX_PLAYER_NAME], string[128];
  		GetPlayerName(playerid, hname, sizeof(hname));
    	format(string, sizeof(string), "%s was working as a Hacker. Type /jobhacker for go to Hacker Job.", hname );
        SendClientMessageToAll(0xFFFF00AA, string);
        HJLimitTimer = SetTimerEx("HJTimeLimit", 300000, 0, "d", playerid);
        HackerSetup(playerid);
        return 1;
   	}
	else
	{
		SendClientMessage(playerid, 0xFF0000AA, "You must be at work Hacker to use this command.");
	}
	return 1;
}