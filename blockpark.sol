pragma solidity ^0.4.11;

contract BlockPark {
    
    struct ParkingSpot {
        string location;
        bool guaranteed;
        bool validated;
    } 
    
    ParkingSpot[] public parkingSpots;
    
    event Logs(address from, uint id, string message);
    
    function setParkingSpot(string location) {
        
        // todo : encrypt PS
        
        parkingSpots.push(ParkingSpot({
            location: location,
            guaranteed: true,
            validated: false
        }));
        
        Logs(msg.sender, parkingSpots.length - 1, "New parking spot");
        
        // todo : call API to return hash to user
    }
    
    function validateGuaranteedParkingSpot(uint id) {
        
        parkingSpots[id].validated = true;
        
        Logs(msg.sender, id, "Parking spot validated");
    }
}