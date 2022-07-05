use lansweeperdb

delete from dbo.tblAssets where FQDN is NULL;
delete from dbo.tblChromeOs where Model = 'Google Chromebook'