#include <libwnck/libwnck.h>
#include <stdlib.h>

static void
on_active_workspace_changed (WnckScreen    *screen,
                             WnckWorkspace *space,
                             gpointer      data)
{
    // Executes a script on workspace change
    system ("~/.workspace-changed/wschanged.sh");
}

int main(int argc, char ** argv)
{

   GMainLoop *loop;
   WnckScreen *screen;

   gdk_init (&argc, &argv);

   loop = g_main_loop_new (NULL, FALSE);
   screen = wnck_screen_get_default();

   g_signal_connect (screen, "active-workspace-changed",
                    G_CALLBACK (on_active_workspace_changed), NULL);

   g_main_loop_run (loop);
   g_main_loop_unref (loop);

   return 0;
}
