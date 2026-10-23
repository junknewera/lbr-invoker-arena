function AppleSignIn_CrossPlatform_Init()
{
    switch (0)
    {
        case 3:
        case 20:
            return extension_stubfunc_real();
        case 1:
            return Mac_AppleSignIn_Init();
    }
}

function AppleSignIn_CrossPlatform_AuthoriseUser()
{
    switch (0)
    {
        case 3:
        case 20:
            Mac_AppleSignIn_RegisterWindow(window_handle());
            return extension_stubfunc_real();
        case 1:
            return Mac_AppleSignIn_AuthoriseUser();
    }
}

function AppleSignIn_CrossPlatform_AddScope(arg0)
{
    switch (0)
    {
        case 3:
        case 20:
            return extension_stubfunc_real(arg0);
        case 1:
            return Mac_AppleSignIn_AddScope(arg0);
    }
}

function AppleSignIn_CrossPlatform_ClearScopes()
{
    switch (0)
    {
        case 3:
        case 20:
            return extension_stubfunc_real();
        case 1:
            return Mac_AppleSignIn_ClearScopes();
    }
}

function AppleSignIn_CrossPlatform_GetCredentialState(arg0)
{
    switch (0)
    {
        case 3:
        case 20:
            return extension_stubfunc_real(arg0);
        case 1:
            return Mac_AppleSignIn_GetCredentialState(arg0);
    }
}
