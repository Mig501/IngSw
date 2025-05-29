from datetime import datetime
import subprocess
import os

def create_backup_mysql(db_name, user, password, backup_dir):
    timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
    backup_file = f"backup_bsa_{timestamp}.sql"
    full_backup_path = os.path.join(backup_dir, backup_file)

    mysqldump_path = r"C:\Program Files\MySQL\MySQL Server 8.0\bin\mysqldump.exe"

    command = [
        mysqldump_path,
        f"-u{user}",
        f"-p{password}",
        db_name
    ]

    try:
        with open(full_backup_path, "w") as backup_file:
            subprocess.run(command, stdout=backup_file, check=True)
            
            return True, full_backup_path
        
    except subprocess.CalledProcessError as e:
        return False, str(e)