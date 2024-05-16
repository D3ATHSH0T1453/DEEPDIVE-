local chest = peripheral.find("minecraft:chest")
local monitor = peripheral.find("monitor")


local width, height = monitor.getSize()

local startY = math.floor((height - 2 * #chest.list()) / 2)

for slot, item in pairs(chest.list()) do
    local itemDetail = chest.getItemDetail(slot)
    if itemDetail ~= nil then
       
        local xPos = math.floor((width - #itemDetail.displayName) / 2)
        monitor.setCursorPos(xPos, startY)
        monitor.write(itemDetail.displayName)

        
        local quantityPos = math.floor((width - #tostring(itemDetail.count)) / 2)
        monitor.setCursorPos(quantityPos, startY + 1)
        monitor.write(tostring(itemDetail.count))

        startY = startY + 2
    end
end