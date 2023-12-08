#include "os/os.h"
#include "../thirdparty/JScript/src/jscript.h"

#include "../thirdparty/sokol/sokol_app.h"
#include "../thirdparty/sokol/sokol_gfx.h"
#include "../thirdparty/sokol/sokol_log.h"
#include "../thirdparty/sokol/sokol_glue.h"

// ---------------------------------------------------------------------------------------- //

sapp_desc g_AppDesc;
sg_desc g_GfxDesc;
sg_pass_action g_GfxPassAction;

// ---------------------------------------------------------------------------------------- //

static void init(void)
{
    g_GfxDesc.context = sapp_sgcontext();
    g_GfxDesc.logger.func = slog_func;
    sg_setup(&g_GfxDesc);

    g_GfxPassAction.colors[0] =
    {
        .load_action = SG_LOADACTION_CLEAR,
        .clear_value = { 1.0f, 0.0f, 0.0f, 1.0f }
    };

    CScripts::Init();
}

static void frame(void)
{
    sg_begin_default_pass(&g_GfxPassAction, sapp_width(), sapp_height());

    //CScripts::Update();

    sg_end_pass();
    sg_commit();
}

static void cleanup(void)
{
    sg_shutdown();
}

// ---------------------------------------------------------------------------------------- //

//int main() { return 0; }
sapp_desc sokol_main(int argc, char* argv[])
{
    (void)argc;
    (void)argv;


    g_AppDesc.init_cb = init;
    g_AppDesc.frame_cb = frame;
    g_AppDesc.cleanup_cb = cleanup;
    g_AppDesc.window_title = "JEngine";
    g_AppDesc.width = 400;
    g_AppDesc.height = 300;
    g_AppDesc.logger.func = slog_func;

    return g_AppDesc;
}