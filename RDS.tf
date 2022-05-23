

# Get the Latest DB Snapshot
# terraform aws data db snapshot
data "aws_db_snapshot" "latest-db-snapshot" {
  db_snapshot_identifier = "${var.database-snapshot_identifier}"
  most_recent            = true
  snapshot_type          = "manual"
}
