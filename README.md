# Gazyi.MultiLanguageStrings
Northstar mod that adds localization interface for custom server-side messages.

## Using this mod
### Clients
Clients need this mod only if their game language is not English.
Unlike in other Portal 2 branch Source games, ConVar `cl_language` is not flagged as "USERINFO". This mod creates "USERINFO"-flagged ConVar `cl_mls_serverlang` that copies value of `cl_language`, so servers can receive its value.

If Northstar adds `FCVAR_USERINFO` flag to `cl_language` ConVar, this requirement will be removed.

### Servers and Modders
Client language is checked after connection, by default it's English. For debugging, clients can use console command `cl_mls_forcelanguage <language>` to override language until level change.

This mod uses JSON translation tables that are located in: `<Path to Titanfall 2 game>\R2Northstar\save_data\Gazyi.MultiLanguageStrings`. After level change, it'll try to load translation file `<Mod Name>.json` for every enabled mod.
##### JSON file example:
```
{
    "Mod":"Gazyi.MultiLanguageStrings",

    "#HelloWorld":
    {
        "english":"Hello World!",
        "french":"Bonjour le Monde!",
        "german":"Hallo Welt!",
        "spanish":"Hola Mundo!",
        "italian":"Ciao Mondo!",
        "japanese":"こんにちは世界!",
        "polish":"Witaj świecie!",
        "russian":"Привет, мир!",
        "tchinese":"你好世界!",
        "portuguese":"Olá, mundo!",
        "mspanish":"Hola Mundo!"
    }
}
```

##### Global functions:
`string function ServerLocalizeTokenForClient( entity player, string szToken, string modName )` - Returns translated string for mod token, if it exists. If there's no translation for client language, fallbacks to English.

`void function ServerAddTranslationsForToken( string szToken, LocalizedStringStruct localizedStruct, string modName, bool bForceSaveTranslation = false )` - Adds translation for specified token to runtime translation table. Saves current mod translation table if there's no file for mod or "bForceSaveTranslation" is set to "true".
