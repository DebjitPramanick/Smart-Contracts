pragma solidity ^0.7.0;
pragma experimental ABIEncoderV2;

contract MedicalRecords{
    
    address owner;
    
    struct Doctor{
        bool verified;
        address d_id;
        string d_name;
    }
    
    struct Patient{
        bool verified;
        address p_id;
        string p_name;
        string[] records;
    }
    
    mapping(address => Doctor) doctors;
    mapping(address => Patient) patients;
    
    constructor() public {
        owner = msg.sender;
    }
    
    modifier isOwner() {
        require(msg.sender==owner, 'Owner is not verified.');
        _;
    }
    
    // Public methods
    
    function registerDoctor(string memory _name, address _id) public isOwner {
        _registerDoctor(_name, _id);
    }
    
    function registerPatient(string memory _name, address _id) public isOwner {
        string[] memory _records;
        _registerPatient(_name, _id, _records);
    }
    
    function getDoctorInfo(address id) public returns(string memory, bool){
       return  _getDoctorInfo(id);
    }
    
    function getPatientInfo(address id) public returns(string memory, bool, string[] memory){
        return _getPatientInfo(id);
    }
    
    // Private methods
    
    function _registerDoctor(string memory _name, address _id) private {
        require(doctors[_id].d_id!=_id, 'Doctor is already registered.');
        doctors[_id] = Doctor({verified: true, d_id: _id, d_name: _name});
    }
    
    function _registerPatient(string memory _name, address _id, string[] memory _records) private {
        require(patients[_id].p_id!=_id, 'Patient is already registered.');
        patients[_id] = Patient({verified: true, p_id: _id, p_name: _name, records: _records});
    }
    
    function _getDoctorInfo(address d_id) private returns(string memory, bool){
        return (doctors[d_id].d_name, doctors[d_id].verified);
    }
    
    function _getPatientInfo(address p_id) private returns(string memory, bool, string[] memory){
        return (patients[p_id].p_name, patients[p_id].verified, patients[p_id].records);
    }
}

