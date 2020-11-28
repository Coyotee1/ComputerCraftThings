require '/ComputerCraftThings/library'
require '/ComputerCraftThings/turtleLibrary'

function excavate(depth, width)
    manageInventory()
    for i=1,width do
        -- turtle.digForward(depth)
        for i=1,depth do
            --manage inventory every 30 blocks
            if i % 30 == 0 then
                manageInventory()
            end
            turtle.digForward()
        end
        turtle.turnRight()
        turtle.turnRight()
        turtle.moveForward(depth)

        --Turn to next row
        turtle.turnLeft()
        turtle.digForward()
        turtle.turnLeft()
    end
end

excavate(10, 5)