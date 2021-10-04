import os
from pathlib import Path
from typing import List, Optional
import typer

app = typer.Typer()

@app.command()
def main(
        origin: Path = typer.Argument(..., exists=True, help="The folder to backup"), 
        destination: Path = typer.Argument(..., exists=True, help="The folder where to store the backup"), 
        filesystem: Optional[Path] = typer.Option(None, exists=True, help="The filesystem to mount on the destination path"), 
        unmount: bool = typer.Option(False, help="Unmount the mounted filesystem specified by --filesystem"),
        exclude: Optional[List[str]] = typer.Option(None, help="Folder to not add to the backup")
    ):
    """
    Use rsync to create a backup of the specified folder in the specified location
    """
    # Mounting the filesystem
    if filesystem != None:
        os.system('sudo mount {0} {1}'.format(filesystem, destination))
    # Executing backup
    if len(exclude) > 0:
        e = "{{'{0}'".format(exclude[0])
        # work on the rest of the tuple if there is to exclude more than one element
        if len(exclude) > 1:
            for x in exclude[1:]:
                e = "{0},'{1}'".format(e,x)
        e = e + "}"
        os.system('sudo rsync --exclude=' + e + ' -aAXv ' + str(origin) + ' ' + str(destination))
    else:
        os.system('sudo rsync -aAXv {0} {1}'.format(origin, destination))
    # Unmounting the filesystem
    if unmount:
        os.system('sudo umount {0}'.format(destination))
    typer.echo(f"Finished")


if __name__ == "__main__":
    app()