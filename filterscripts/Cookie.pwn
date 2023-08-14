// * ViruZZzZ_ChiLLLs Cookie System :) * //
// |
// * Some notes :
// --- First : I added a little bit killing spree system ;) you can define their cookie award below.
// --- Second : You can define how many money can they buy a cookie right below.
// --- Third : Change the things that has the sign (CHANGE ME) on them.
// --- Fourth : Enjoy your Cookie System ;)
// |
// * Updates :
// --- First Release (June 07, 2010)



#include <a_samp>
#include <Dini>

#define PlayerFile                  "Cookie System/%s.ini"
#pragma unused strtok


#define cookieD 187

// (CHANGE THIS) Buy cookies worth :
#define C1_COOKIES 100 // 1 cookies is worth $100
#define C3_COOKIES 300
#define C5_COOKIES 500
#define C10_COOKIES 1000
#define C15_COOKIES 1500
#define C20_COOKIES 2000

// (CHANGE THIS) Sell cookies worth :
#define S1_COOKIES 50
#define S3_COOKIES 150
#define S5_COOKIES 250
#define S10_COOKIES 500
#define S15_COOKIES 750
#define S20_COOKIES 1000

// (CHANGE THIS) Cookie Reward for killingsprees
#define KillingSpree3 5 // for 3 killing spree the player gets 3 cookies
#define KillingSpree5 8
#define KillingSpree10 15
#define KillingSpree15 20
#define KillingSpree20 30
#define KillingSpree35 50
#define KillingSpree50 100

#define dcmd(%1,%2,%3) if (!strcmp((%3)[1], #%1, true, (%2)) && ((((%3)[(%2) + 1] == '\0') && (dcmd_%1(playerid, ""))) || (((%3)[(%2) + 1] == ' ') && (dcmd_%1(playerid, (%3)[(%2) + 2]))))) return 1


#define Red 0xFF0000FF
#define Grey 0xAFAFAFAA
#define Green 0x33AA33AA
#define Yellow 0xFFFF00AA
#define White 0xFFFFFFAA
#define Blue 0x0000BBAA
#define Lightblue 0x33CCFFAA
#define Orange 0xFF9900AA
#define Lime 0x10F441AA
#define Magenta 0xFF00FFFFT
#define Navy 0x000080AA
#define Aqua 0xF0F8FFAA
#define Crimson 0xDC143CAA
#define Black 0x000000AA
#define Brown 0XA52A2AAA
#define Gold 0xB8860BAA
#define Limegreen 0x32CD32AA



new KillingSpree[MAX_PLAYERS];


enum PLAYER_MAIN
{
   Cookies
}


new giveplayerid, amount;
new pInfo[MAX_PLAYERS][PLAYER_MAIN];
public OnPlayerConnect(playerid)
{
 	new file[100],Name[MAX_PLAYER_NAME],Ip[16]; GetPlayerName(playerid,Name,sizeof(Name)); GetPlayerIp(playerid,Ip,sizeof(Ip)); format(file,sizeof(file),PlayerFile,Name);
	if(!dini_Exists(file)) {
	    dini_Create(file);
		dini_IntSet(file,"Cookies", pInfo[playerid][Cookies]);
	}
	pInfo[playerid][Cookies] = dini_Int(file,"Cookies");
	return 1;
}

public OnPlayerDisconnect(playerid, reason)
{
	new file[100],Name[MAX_PLAYER_NAME],Ip[16]; GetPlayerName(playerid,Name,sizeof(Name)); GetPlayerIp(playerid,Ip,sizeof(Ip)); format(file,sizeof(file),PlayerFile,Name);
	dini_IntSet(file,"Cookies", pInfo[playerid][Cookies]);
	return 1;
}

public OnPlayerCommandText(playerid, cmdtext[])
{
    dcmd(givecookies, 11, cmdtext);
    dcmd(setcookies, 10, cmdtext);
    dcmd(mycookies, 9, cmdtext);
	dcmd(cookiesof, 9, cmdtext);
	dcmd(buycookies, 10, cmdtext);
	dcmd(eatcookies, 10, cmdtext);
	dcmd(cookiehelp, 10, cmdtext);
	dcmd(sellcookies, 10, cmdtext);
    return 0;
}

dcmd_cookiehelp(playerid, params[])
{
#pragma unused params
if(IsPlayerAdmin(playerid) == 1) return ShowPlayerDialog(playerid, cookieD+1, DIALOG_STYLE_MSGBOX, "Cookie Help", "/setcookies [playerid] [amount]\n/givecookies [playerid] [amount]\n/cookiesof [playerid]\n/eatcookies - You will gain 10HP\n/mycookies - Will display your total cookies.\n/buycookies - You will buy cookies.\n/sellcookies - You can sell your cookies.", "Done", "Exit");
ShowPlayerDialog(playerid, cookieD+2, DIALOG_STYLE_MSGBOX, "Cookie Help", "/givecookies [playerid] [amount]\n/cookiesof [playerid]\n/eatcookies - You will gain 10HP\n/mycookies - Will display your total cookies.\n/buycookies - You will buy cookies.\n/sellcookies - You can sell your cookies.", "Done", "Exit");
return 1;
}
public OnPlayerDeath(playerid, killerid, reason)
{
    SendDeathMessage(playerid, killerid, reason);
    KillingSpree[playerid] = 0;
    KillingSpree[killerid]++;
    new file[100],Name[MAX_PLAYER_NAME],Ip[16],name[MAX_PLAYER_NAME]; GetPlayerName(giveplayerid, name, sizeof(name));GetPlayerName(playerid,Name,sizeof(Name)); GetPlayerIp(playerid,Ip,sizeof(Ip)); format(file,sizeof(file),PlayerFile,Name);
    if(KillingSpree[killerid] == 50)
     {
      new pName[MAX_PLAYER_NAME]; GetPlayerName(killerid,pName,MAX_PLAYER_NAME);
      new string[128]; format(string,sizeof(string),"%s is on a killing spree! (Kills : 50) (Reward : $60000 + %d Cookies)",pName, KillingSpree50);
      SendClientMessageToAll(Red, string);
      pInfo[playerid][Cookies] += KillingSpree50;
      dini_IntSet(file,"Cookies", pInfo[killerid][Cookies]);
     }

    if(KillingSpree[killerid] == 35)
     {
      new pName[MAX_PLAYER_NAME]; GetPlayerName(killerid,pName,MAX_PLAYER_NAME);
      new string[128]; format(string,sizeof(string),"%s is on a killing spree! (Kills : 35) (Reward : $25000 + %d Cookies)",pName, KillingSpree35);
      SendClientMessageToAll(Red, string);
      pInfo[playerid][Cookies] += KillingSpree35;
      dini_IntSet(file,"Cookies", pInfo[killerid][Cookies]);
     }
     
    if(KillingSpree[killerid] == 20)
     {
      new pName[MAX_PLAYER_NAME]; GetPlayerName(killerid,pName,MAX_PLAYER_NAME);
      new string[128]; format(string,sizeof(string),"%s is on a killing spree! (Kills : 20) (Reward : $25000 + %d Cookies)",pName, KillingSpree20);
      SendClientMessageToAll(Red, string);
      pInfo[playerid][Cookies] += KillingSpree20;
      dini_IntSet(file,"Cookies", pInfo[killerid][Cookies]);
     }

    if(KillingSpree[killerid] == 15)
     {
      new pName[MAX_PLAYER_NAME]; GetPlayerName(killerid,pName,MAX_PLAYER_NAME);
      new string[128]; format(string,sizeof(string),"%s is on a killing spree! (Kills : 15) (Reward : $15000 + %d cookies)",pName, KillingSpree15);
      SendClientMessageToAll(Red, string);
      pInfo[playerid][Cookies] += KillingSpree15;
      dini_IntSet(file,"Cookies", pInfo[killerid][Cookies]);
     }

    if(KillingSpree[killerid] == 10)
     {
      new pName[MAX_PLAYER_NAME]; GetPlayerName(killerid,pName,MAX_PLAYER_NAME);
      new string[128]; format(string,sizeof(string),"%s is on a killing spree! (Kills : 10) (Reward : $10000 + %d cookies)",pName, KillingSpree10);
      SendClientMessageToAll(Red, string);
      pInfo[playerid][Cookies] += KillingSpree10;
      dini_IntSet(file,"Cookies", pInfo[killerid][Cookies]);
     }

    if(KillingSpree[killerid] == 5)
     {
      new pName[MAX_PLAYER_NAME]; GetPlayerName(killerid,pName,MAX_PLAYER_NAME);
      new string[128]; format(string,sizeof(string),"%s is on a killing spree! (Kills : 5) (Reward : $5000 + %d cookies)",pName, KillingSpree5);
      SendClientMessageToAll(Red, string);
      pInfo[playerid][Cookies] += KillingSpree5;
      dini_IntSet(file,"Cookies", pInfo[killerid][Cookies]);
     }


    if(KillingSpree[killerid] == 3)
     {
      new pName[MAX_PLAYER_NAME]; GetPlayerName(killerid,pName,MAX_PLAYER_NAME);
      new string[128]; format(string,sizeof(string),"%s is on a killing spree! (Kills : 3) (Reward : $1500 + %d cookies)",pName, KillingSpree3);
      SendClientMessageToAll(Red, string);
      pInfo[playerid][Cookies] += KillingSpree3;
      dini_IntSet(file,"Cookies", pInfo[killerid][Cookies]);
     }
    return 1;
}
public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
  new string[156],file[100],Name[MAX_PLAYER_NAME],Ip[16],name[MAX_PLAYER_NAME]; GetPlayerName(giveplayerid, name, sizeof(name));GetPlayerName(playerid,Name,sizeof(Name)); GetPlayerIp(playerid,Ip,sizeof(Ip)); format(file,sizeof(file),PlayerFile,Name);
  if(dialogid == cookieD && response)
  {
   switch(listitem)
   {
   case 0:
   {
   if( GetPlayerMoney(playerid)  <  C1_COOKIES) return SendClientMessage(playerid, Red, "ERROR : You dont have enough money to buy a cookie!");
   pInfo[playerid][Cookies] += 1;
   GivePlayerMoney(playerid, -C1_COOKIES);
   dini_IntSet(file,"Cookies", pInfo[playerid][Cookies]);
   SendClientMessage(playerid, Limegreen, "You have succesfully bought 1 cookie!");
   format(string, sizeof(string), "1 Cookie        [$%d]\n3 Cookies      [$%d]\n5 Cookies      [$%d]\n10 Cookies    [$%d]\n15 Cookies    [$%d]\n20 Cookies    [$%d]", C1_COOKIES, C3_COOKIES, C5_COOKIES, C10_COOKIES, C15_COOKIES, C20_COOKIES);
   ShowPlayerDialog(playerid, cookieD, DIALOG_STYLE_LIST, "Buy Cookies", string, "Buy", "Exit");
   }
   case 1:
   {
   if( GetPlayerMoney(playerid)  <  C3_COOKIES) return SendClientMessage(playerid, Red, "ERROR : You dont have enough money to buy a cookie!");
   pInfo[playerid][Cookies] += 3;
   GivePlayerMoney(playerid, -C3_COOKIES);
   dini_IntSet(file,"Cookies", pInfo[playerid][Cookies]);
   SendClientMessage(playerid, Limegreen, "You have succesfully bought 3 cookies!");
   format(string, sizeof(string), "1 Cookie        [$%d]\n3 Cookies      [$%d]\n5 Cookies      [$%d]\n10 Cookies    [$%d]\n15 Cookies    [$%d]\n20 Cookies    [$%d]", C1_COOKIES, C3_COOKIES, C5_COOKIES, C10_COOKIES, C15_COOKIES, C20_COOKIES);
   ShowPlayerDialog(playerid, cookieD, DIALOG_STYLE_LIST, "Buy Cookies", string, "Buy", "Exit");
   }
   case 2:
   {
   if( GetPlayerMoney(playerid)  <  C5_COOKIES) return SendClientMessage(playerid, Red, "ERROR : You dont have enough money to buy a cookie!");
   pInfo[playerid][Cookies] += 5;
   GivePlayerMoney(playerid, -C5_COOKIES);
   dini_IntSet(file,"Cookies", pInfo[playerid][Cookies]);
   SendClientMessage(playerid, Limegreen, "You have succesfully bought 5 cookies!");
   format(string, sizeof(string), "1 Cookie        [$%d]\n3 Cookies      [$%d]\n5 Cookies      [$%d]\n10 Cookies    [$%d]\n15 Cookies    [$%d]\n20 Cookies    [$%d]", C1_COOKIES, C3_COOKIES, C5_COOKIES, C10_COOKIES, C15_COOKIES, C20_COOKIES);
   ShowPlayerDialog(playerid, cookieD, DIALOG_STYLE_LIST, "Buy Cookies", string, "Buy", "Exit");
   }
   case 3:
   {
   if( GetPlayerMoney(playerid)  <  C10_COOKIES) return SendClientMessage(playerid, Red, "ERROR : You dont have enough money to buy a cookie!");
   pInfo[playerid][Cookies] += 10;
   GivePlayerMoney(playerid, -C10_COOKIES);
   dini_IntSet(file,"Cookies", pInfo[playerid][Cookies]);
   SendClientMessage(playerid, Limegreen, "You have succesfully bought 10 cookies!");
   format(string, sizeof(string), "1 Cookie        [$%d]\n3 Cookies      [$%d]\n5 Cookies      [$%d]\n10 Cookies    [$%d]\n15 Cookies    [$%d]\n20 Cookies    [$%d]", C1_COOKIES, C3_COOKIES, C5_COOKIES, C10_COOKIES, C15_COOKIES, C20_COOKIES);
   ShowPlayerDialog(playerid, cookieD, DIALOG_STYLE_LIST, "Buy Cookies", string, "Buy", "Exit");
   }
   case 4:
   {
   if( GetPlayerMoney(playerid)  <  C15_COOKIES) return SendClientMessage(playerid, Red, "ERROR : You dont have enough money to buy a cookie!");
   pInfo[playerid][Cookies] += 15;
   GivePlayerMoney(playerid, -C15_COOKIES);
   dini_IntSet(file,"Cookies", pInfo[playerid][Cookies]);
   SendClientMessage(playerid, Limegreen, "You have succesfully bought 15 cookies!");
   format(string, sizeof(string), "1 Cookie        [$%d]\n3 Cookies      [$%d]\n5 Cookies      [$%d]\n10 Cookies    [$%d]\n15 Cookies    [$%d]\n20 Cookies    [$%d]", C1_COOKIES, C3_COOKIES, C5_COOKIES, C10_COOKIES, C15_COOKIES, C20_COOKIES);
   ShowPlayerDialog(playerid, cookieD, DIALOG_STYLE_LIST, "Buy Cookies", string, "Buy", "Exit");
   }
   case 5:
   {
   if( GetPlayerMoney(playerid)  <  C20_COOKIES) return SendClientMessage(playerid, Red, "ERROR : You dont have enough money to buy a cookie!");
   pInfo[playerid][Cookies] += 20;
   GivePlayerMoney(playerid, -C20_COOKIES);
   dini_IntSet(file,"Cookies", pInfo[playerid][Cookies]);
   SendClientMessage(playerid, Limegreen, "You have succesfully bought 20 cookies!");
   format(string, sizeof(string), "1 Cookie        [$%d]\n3 Cookies      [$%d]\n5 Cookies      [$%d]\n10 Cookies    [$%d]\n15 Cookies    [$%d]\n20 Cookies    [$%d]", C1_COOKIES, C3_COOKIES, C5_COOKIES, C10_COOKIES, C15_COOKIES, C20_COOKIES);
   ShowPlayerDialog(playerid, cookieD, DIALOG_STYLE_LIST, "Buy Cookies", string, "Buy", "Exit");
   }
   }
   }
   
  if(dialogid == cookieD+10 && response)
  {
   switch(listitem)
   {
   case 0:
   {
   if(pInfo[playerid][Cookies] < 1) return SendClientMessage(playerid, Red, "ERROR : You dont have enough cookies to sell!");
   pInfo[playerid][Cookies] -= 1;
   GivePlayerMoney(playerid, S1_COOKIES);
   dini_IntSet(file,"Cookies", pInfo[playerid][Cookies]);
   SendClientMessage(playerid, Limegreen, "You have succesfully sold 1 cookie!");
   format(string, sizeof(string), "1 Cookie        [$%d]\n3 Cookies      [$%d]\n5 Cookies      [$%d]\n10 Cookies    [$%d]\n15 Cookies    [$%d]\n20 Cookies    [$%d]", S1_COOKIES, S3_COOKIES, S5_COOKIES, S10_COOKIES, S15_COOKIES, S20_COOKIES);
   ShowPlayerDialog(playerid, cookieD+10, DIALOG_STYLE_LIST, "Sell Cookies", string, "Sell", "Exit");
   }
   case 1:
   {
   if(pInfo[playerid][Cookies] < 3) return SendClientMessage(playerid, Red, "ERROR : You dont have enough cookies to sell!");
   pInfo[playerid][Cookies] -= 3;
   GivePlayerMoney(playerid, S3_COOKIES);
   dini_IntSet(file,"Cookies", pInfo[playerid][Cookies]);
   SendClientMessage(playerid, Limegreen, "You have succesfully sold 3 cookies!");
   format(string, sizeof(string), "1 Cookie        [$%d]\n3 Cookies      [$%d]\n5 Cookies      [$%d]\n10 Cookies    [$%d]\n15 Cookies    [$%d]\n20 Cookies    [$%d]", S1_COOKIES, S3_COOKIES, S5_COOKIES, S10_COOKIES, S15_COOKIES, S20_COOKIES);
   ShowPlayerDialog(playerid, cookieD+10, DIALOG_STYLE_LIST, "Sell Cookies", string, "Sell", "Exit");
   }
   case 2:
   {
   if(pInfo[playerid][Cookies] < 5) return SendClientMessage(playerid, Red, "ERROR : You dont have enough cookies to sell!");
   pInfo[playerid][Cookies] -= 5;
   GivePlayerMoney(playerid, S5_COOKIES);
   dini_IntSet(file,"Cookies", pInfo[playerid][Cookies]);
   SendClientMessage(playerid, Limegreen, "You have succesfully sold 5 cookies!");
   format(string, sizeof(string), "1 Cookie        [$%d]\n3 Cookies      [$%d]\n5 Cookies      [$%d]\n10 Cookies    [$%d]\n15 Cookies    [$%d]\n20 Cookies    [$%d]", S1_COOKIES, S3_COOKIES, S5_COOKIES, S10_COOKIES, S15_COOKIES, S20_COOKIES);
   ShowPlayerDialog(playerid, cookieD+10, DIALOG_STYLE_LIST, "Sell Cookies", string, "Sell", "Exit");
   }
   case 3:
   {
   if(pInfo[playerid][Cookies] < 10) return SendClientMessage(playerid, Red, "ERROR : You dont have enough cookies to sell!");
   pInfo[playerid][Cookies] -= 10;
   GivePlayerMoney(playerid, S10_COOKIES);
   dini_IntSet(file,"Cookies", pInfo[playerid][Cookies]);
   SendClientMessage(playerid, Limegreen, "You have succesfully sold 10 cookies!");
   format(string, sizeof(string), "1 Cookie        [$%d]\n3 Cookies      [$%d]\n5 Cookies      [$%d]\n10 Cookies    [$%d]\n15 Cookies    [$%d]\n20 Cookies    [$%d]", S1_COOKIES, S3_COOKIES, S5_COOKIES, S10_COOKIES, S15_COOKIES, S20_COOKIES);
   ShowPlayerDialog(playerid, cookieD+10, DIALOG_STYLE_LIST, "Sell Cookies", string, "Sell", "Exit");
   }
   case 4:
   {
   if(pInfo[playerid][Cookies] < 15) return SendClientMessage(playerid, Red, "ERROR : You dont have enough cookies to sell!");
   pInfo[playerid][Cookies] -= 15;
   GivePlayerMoney(playerid, S15_COOKIES);
   dini_IntSet(file,"Cookies", pInfo[playerid][Cookies]);
   SendClientMessage(playerid, Limegreen, "You have succesfully sold 15 cookies!");
   format(string, sizeof(string), "1 Cookie        [$%d]\n3 Cookies      [$%d]\n5 Cookies      [$%d]\n10 Cookies    [$%d]\n15 Cookies    [$%d]\n20 Cookies    [$%d]", S1_COOKIES, S3_COOKIES, S5_COOKIES, S10_COOKIES, S15_COOKIES, S20_COOKIES);
   ShowPlayerDialog(playerid, cookieD+10, DIALOG_STYLE_LIST, "Sell Cookies", string, "Sell", "Exit");
   }
   case 5:
   {
   if(pInfo[playerid][Cookies] < 20) return SendClientMessage(playerid, Red, "ERROR : You dont have enough cookies to sell!");
   pInfo[playerid][Cookies] -= 20;
   GivePlayerMoney(playerid, S20_COOKIES);
   dini_IntSet(file,"Cookies", pInfo[playerid][Cookies]);
   SendClientMessage(playerid, Limegreen, "You have succesfully sold 20 cookies!");
   format(string, sizeof(string), "1 Cookie        [$%d]\n3 Cookies      [$%d]\n5 Cookies      [$%d]\n10 Cookies    [$%d]\n15 Cookies    [$%d]\n20 Cookies    [$%d]", S1_COOKIES, S3_COOKIES, S5_COOKIES, S10_COOKIES, S15_COOKIES, S20_COOKIES);
   ShowPlayerDialog(playerid, cookieD+10, DIALOG_STYLE_LIST, "Sell Cookies", string, "Sell", "Exit");
   }
   }
   }
  return 1;
}

dcmd_sellcookies(playerid, params[])
{
#pragma unused params
new string[156];
format(string, sizeof(string), "1 Cookie       [$%d]\n3 Cookies      [$%d]\n5 Cookies      [$%d]\n10 Cookies    [$%d]\n15 Cookies    [$%d]\n20 Cookies    [$%d]", S1_COOKIES, S3_COOKIES, S5_COOKIES, S10_COOKIES, S15_COOKIES, S20_COOKIES);
ShowPlayerDialog(playerid, cookieD+10, DIALOG_STYLE_LIST, "Sell Cookies", string, "Buy", "Exit");
return 1;
}

dcmd_buycookies(playerid, params[])
{
#pragma unused params
new string[156];
format(string, sizeof(string), "1 Cookie       [$%d]\n3 Cookies      [$%d]\n5 Cookies      [$%d]\n10 Cookies    [$%d]\n15 Cookies    [$%d]\n20 Cookies    [$%d]", C1_COOKIES, C3_COOKIES, C5_COOKIES, C10_COOKIES, C15_COOKIES, C20_COOKIES);
ShowPlayerDialog(playerid, cookieD, DIALOG_STYLE_LIST, "Buy Cookies", string, "Buy", "Exit");
return 1;
}

dcmd_givecookies(playerid, params[])
{
if(sscanf(params, "ud", giveplayerid, amount)) SendClientMessage(playerid, Orange, "USAGE : /givecookie [playerid] [amount]");
else if(giveplayerid == INVALID_PLAYER_ID) SendClientMessage(playerid, Red, "ERROR : That player is not connected!");
else if(giveplayerid == playerid) SendClientMessage(playerid, Red, "ERROR : You cant send yourself a cookie!");
else if(amount > pInfo[playerid][Cookies]) SendClientMessage(playerid, Red, "ERROR : You dont have that amount of cookie!");
else
{
new string[156],file[100],Name[MAX_PLAYER_NAME],Ip[16],name[MAX_PLAYER_NAME]; GetPlayerName(giveplayerid, name, sizeof(name));GetPlayerName(playerid,Name,sizeof(Name)); GetPlayerIp(playerid,Ip,sizeof(Ip)); format(file,sizeof(file),PlayerFile,Name);
format(string, sizeof(string), "SERVER : You have succesfully sent %d cookies to %s!", amount, name);
SendClientMessage(playerid, Limegreen, string);
format(string, sizeof(string), "SERVER : %s has given you %d cookies!", Name, amount);
SendClientMessage(giveplayerid, Limegreen, string);
pInfo[giveplayerid][Cookies] += amount;
pInfo[playerid][Cookies] -= amount;
dini_IntSet(file,"Cookies", pInfo[giveplayerid][Cookies]);
dini_IntSet(file,"Cookies", pInfo[playerid][Cookies]);
}
return 1;
}

dcmd_eatcookies(playerid, params[])
{
#pragma unused params
new Float:health;
GetPlayerHealth(playerid, health);
if(health == 100) return SendClientMessage(playerid, Red, "ERROR : You already have a full health!");
if(health >= 100) return SetPlayerHealth(playerid, 100);
SetPlayerHealth(playerid, health+10);
pInfo[playerid][Cookies] -= 1;
new file[100],Name[MAX_PLAYER_NAME],Ip[16]; GetPlayerName(playerid,Name,sizeof(Name)); GetPlayerIp(playerid,Ip,sizeof(Ip)); format(file,sizeof(file),PlayerFile,Name);
dini_IntSet(file,"Cookies", pInfo[playerid][Cookies]);
return 1;
}

dcmd_cookiesof(playerid, params[])
{
if(sscanf(params, "u", giveplayerid)) SendClientMessage(playerid, Orange, "USAGE : /cookiesof [playerid]");
else if(giveplayerid == INVALID_PLAYER_ID) SendClientMessage(playerid, Red, "ERROR : That player is not connected!");
else if(giveplayerid == playerid) SendClientMessage(playerid, Red, "ERROR : Use /mycookies to check out how many cookies you have!");
else
{
new string[156], str[MAX_PLAYER_NAME]; GetPlayerName(giveplayerid, str, sizeof(str));
format(string, sizeof(string), "SERVER : Player %s has %d!", str, pInfo[giveplayerid][Cookies]);
SendClientMessage(playerid, Limegreen, string);
}
return 1;
}

dcmd_mycookies(playerid, params[])
{
#pragma unused params
new string[126];
format(string, sizeof(string), "SERVER : You have %d cookies!", pInfo[playerid][Cookies]);
SendClientMessage(playerid, Limegreen, string);
return 1;
}

dcmd_setcookies(playerid, params[])
{
if(IsPlayerAdmin(playerid) == 0) return SendClientMessage(playerid, Red, "ERROR : Only admins can use that command!");
if(sscanf(params, "ud", giveplayerid, amount)) SendClientMessage(playerid, Orange, "USAGE : /setcookie [playerid] [amount]");
else if(giveplayerid == INVALID_PLAYER_ID) SendClientMessage(playerid, Red, "ERROR : That player is not connected!");
else
{
new string[156],file[100],Name[MAX_PLAYER_NAME],Ip[16],name[MAX_PLAYER_NAME]; GetPlayerName(giveplayerid, name, sizeof(name));GetPlayerName(playerid,Name,sizeof(Name)); GetPlayerIp(playerid,Ip,sizeof(Ip)); format(file,sizeof(file),PlayerFile,Name);
format(string, sizeof(string), "SERVER : You have succesfully setted %s cookies to %d!", name, amount);
SendClientMessage(playerid, Limegreen, string);
format(string, sizeof(string), "SERVER : Admin %s has setted your cookies to %d!", Name, amount);
SendClientMessage(giveplayerid, Limegreen, string);
pInfo[giveplayerid][Cookies] = amount;
dini_IntSet(file,"Cookies", pInfo[giveplayerid][Cookies]);
}
return 1;
}

stock sscanf(string[], format[], {Float,_}:...)
{
	#if defined isnull
		if (isnull(string))
	#else
		if (string[0] == 0 || (string[0] == 1 && string[1] == 0))
	#endif
		{
			return format[0];
		}
	#pragma tabsize 4
	new
		formatPos = 0,
		stringPos = 0,
		paramPos = 2,
		paramCount = numargs(),
		delim = ' ';
	while (string[stringPos] && string[stringPos] <= ' ')
	{
		stringPos++;
	}
	while (paramPos < paramCount && string[stringPos])
	{
		switch (format[formatPos++])
		{
			case '\0':
			{
				return 0;
			}
			case 'i', 'd':
			{
				new
					neg = 1,
					num = 0,
					ch = string[stringPos];
				if (ch == '-')
				{
					neg = -1;
					ch = string[++stringPos];
				}
				do
				{
					stringPos++;
					if ('0' <= ch <= '9')
					{
						num = (num * 10) + (ch - '0');
					}
					else
					{
						return -1;
					}
				}
				while ((ch = string[stringPos]) > ' ' && ch != delim);
				setarg(paramPos, 0, num * neg);
			}
			case 'h', 'x':
			{
				new
					num = 0,
					ch = string[stringPos];
				do
				{
					stringPos++;
					switch (ch)
					{
						case 'x', 'X':
						{
							num = 0;
							continue;
						}
						case '0' .. '9':
						{
							num = (num << 4) | (ch - '0');
						}
						case 'a' .. 'f':
						{
							num = (num << 4) | (ch - ('a' - 10));
						}
						case 'A' .. 'F':
						{
							num = (num << 4) | (ch - ('A' - 10));
						}
						default:
						{
							return -1;
						}
					}
				}
				while ((ch = string[stringPos]) > ' ' && ch != delim);
				setarg(paramPos, 0, num);
			}
			case 'c':
			{
				setarg(paramPos, 0, string[stringPos++]);
			}
			case 'f':
			{

				new changestr[16], changepos = 0, strpos = stringPos;
				while(changepos < 16 && string[strpos] && string[strpos] != delim)
				{
					changestr[changepos++] = string[strpos++];
    				}
				changestr[changepos] = '\0';
				setarg(paramPos,0,_:floatstr(changestr));
			}
			case 'p':
			{
				delim = format[formatPos++];
				continue;
			}
			case '\'':
			{
				new
					end = formatPos - 1,
					ch;
				while ((ch = format[++end]) && ch != '\'') {}
				if (!ch)
				{
					return -1;
				}
				format[end] = '\0';
				if ((ch = strfind(string, format[formatPos], false, stringPos)) == -1)
				{
					if (format[end + 1])
					{
						return -1;
					}
					return 0;
				}
				format[end] = '\'';
				stringPos = ch + (end - formatPos);
				formatPos = end + 1;
			}
			case 'u':
			{
				new
					end = stringPos - 1,
					id = 0,
					bool:num = true,
					ch;
				while ((ch = string[++end]) && ch != delim)
				{
					if (num)
					{
						if ('0' <= ch <= '9')
						{
							id = (id * 10) + (ch - '0');
						}
						else
						{
							num = false;
						}
					}
				}
				if (num && IsPlayerConnected(id))
				{
					setarg(paramPos, 0, id);
				}
				else
				{
					#if !defined foreach
						#define foreach(%1,%2) for (new %2 = 0; %2 < MAX_PLAYERS; %2++) if (IsPlayerConnected(%2))
						#define __SSCANF_FOREACH__
					#endif
					string[end] = '\0';
					num = false;
					new
						name[MAX_PLAYER_NAME];
					id = end - stringPos;
					foreach (Player, playerid)
					{
						GetPlayerName(playerid, name, sizeof (name));
						if (!strcmp(name, string[stringPos], true, id))
						{
							setarg(paramPos, 0, playerid);
							num = true;
							break;
						}
					}
					if (!num)
					{
						setarg(paramPos, 0, INVALID_PLAYER_ID);
					}
					string[end] = ch;
					#if defined __SSCANF_FOREACH__
						#undef foreach
						#undef __SSCANF_FOREACH__
					#endif
				}
				stringPos = end;
			}
			case 's', 'z':
			{
				new
					i = 0,
					ch;
				if (format[formatPos])
				{
					while ((ch = string[stringPos++]) && ch != delim)
					{
						setarg(paramPos, i++, ch);
					}
					if (!i)
					{
						return -1;
					}
				}
				else
				{
					while ((ch = string[stringPos++]))
					{
						setarg(paramPos, i++, ch);
					}
				}
				stringPos--;
				setarg(paramPos, i, '\0');
			}
			default:
			{
				continue;
			}
		}
		while (string[stringPos] && string[stringPos] != delim && string[stringPos] > ' ')
		{
			stringPos++;
		}
		while (string[stringPos] && (string[stringPos] == delim || string[stringPos] <= ' '))
		{
			stringPos++;
		}
		paramPos++;
	}
	do
	{
		if ((delim = format[formatPos++]) > ' ')
		{
			if (delim == '\'')
			{
				while ((delim = format[formatPos++]) && delim != '\'') {}
			}
			else if (delim != 'z')
			{
				return delim;
			}
		}
	}
	while (delim > ' ');
	return 0;
}
