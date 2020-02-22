int
	g_iOldFlags = -1;
	
public Plugin myinfo =
{
	name				=	"Titan 2 - No Refunds",
	author				=	"myst",
	description 		=	"Disable refunds on Mann vs Machine servers.",
	version			 	=	"2.0",
	url				 	=	"https://titan.tf",
};

public void OnPluginStart()
{
	g_iOldFlags = GetCommandFlags("tf_mvm_respec_enabled");
	SetCommandFlags("tf_mvm_respec_enabled", g_iOldFlags & ~FCVAR_CHEAT);
	
	ServerCommand("tf_mvm_respec_enabled 0");
	CreateTimer(0.25, Timer_ResetFlag, _, _);
}

public Action Timer_ResetFlag(Handle hTimer)
{
	SetCommandFlags("tf_mvm_respec_enabled", g_iOldFlags);
}