#include <sourcemod>
#include <dhooks>

Handle g_VaccBlock = INVALID_HANDLE;

public Plugin myinfo = 
{
    name = "Vaccinator Swap Fix",
    author = "Rowedahelicon",
    description = "Fixes issues with losing ubercharges when swapping from the Vaccinator.",
    version = "1.0",
    url = "https://www.rowedahelicon.com"
}

public OnPluginStart()
{
    Handle hConf = LoadGameConfigFile("medic");
    
    g_VaccBlock = DHookCreateFromConf(hConf, "CTFPlayerShared::SetChargeEffect");
    if (g_VaccBlock == INVALID_HANDLE)
    {
        SetFailState("Failed to load CTFPlayerShared::SetChargeEffect");
    }

    DHookAddParam(g_VaccBlock, HookParamType_Int);
    DHookEnableDetour(g_VaccBlock, false, Detour_ValidMap);
}

public MRESReturn Detour_ValidMap(Address self, Handle hReturn, Handle params)
{
    int mission = DHookGetParam(params, 1);
    if( mission == 3 || mission == 4 || mission == 5 )
    {
        DHookSetReturn(hReturn, true);
        return MRES_Supercede;
    }
    else
    {
        return MRES_Ignored;
    }
}