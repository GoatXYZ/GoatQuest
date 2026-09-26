local name,GQ=...
GQ.revision = tonumber(string.sub("$Revision: 37145 $", 12, -3))
GQ.version = C_AddOns.GetAddOnMetadata(name,"version") .. "." .. GQ.revision
GQ.date = string.sub("$Date: $WCDATE$ $", 8, 17)
--$WCNOW$

