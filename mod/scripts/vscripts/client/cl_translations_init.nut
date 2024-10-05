global function ClientTranslantionsInit

void function ClientTranslantionsInit()
{
    string cl_lang = GetConVarString( "cl_language" )
    #if DEV
    printt( "[MultiLanguageStrings] Client language ConVar: " + cl_lang )
    #endif
    if ( GetConVarString( "cl_mls_serverlang" ) != cl_lang )
    {
        SetConVarString( "cl_mls_serverlang", cl_lang )
        #if DEV
        printt( "[MultiLanguageStrings] Server language ConVar set to: " + GetConVarString( "cl_mls_serverlang" ) )
        #endif
    }
}
