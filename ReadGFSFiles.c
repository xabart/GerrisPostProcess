#include <gfs.h>


int main (int argc, char * argv[])
{


  gfs_init (&argc, &argv);
  GtsFile * fp = gts_file_new (stdin);
  GfsSimulation * simulation = gfs_simulation_read (fp);
  if (simulation == NULL) {
    fprintf (stderr,
             "myprogram: file on standard input is not a valid simulation file\n"
             "<stdin>:%d:%d: %s\n",
             fp->line, fp->pos, fp->error);
    return 1;
  }
  gts_file_destroy (fp);
  /* do stuff with simulation */ 
  
  
  gts_object_destroy (GTS_OBJECT (simulation)); 
}
