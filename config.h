/* user and group to drop privileges to */
static const char *user = "iamb4uc";
static const char *group = "iamb4uc";

static const char *colorname[NUMCOLS] = {
    [BACKGROUND] = "#1d2021", /* after initialization */
    [INIT] = "#fbf1c7",       /* after initialization */
    [INPUT] = "#b8bb26",      /* during input */
    [FAILED] = "#fb4934",     /* wrong password */
};

/* treat a cleared input like a wrong password (color) */
static const int failonclear = 1;

static const char *logofont = "DepartureMono Nerd Font:size=12:antialias=true";

static const char *asciilogo[] = {
"████▄  ▄████▄ ▄████▄ ██▄  ▄██ ▄█████ ████▄  ▄████▄ ██  ██   ▄█████ ██  ██ ▄█████ ██████ ██████ ██▄  ▄██ ",
"██  ██ ██  ██ ██  ██ ██ ▀▀ ██ ▀▀▀▄▄▄ ██  ██ ██▄▄██  ▀██▀    ▀▀▀▄▄▄  ▀██▀  ▀▀▀▄▄▄   ██   ██▄▄   ██ ▀▀ ██ ",
"████▀  ▀████▀ ▀████▀ ██    ██ █████▀ ████▀  ██  ██   ██     █████▀   ██   █████▀   ██   ██▄▄▄▄ ██    ██ ",
};
