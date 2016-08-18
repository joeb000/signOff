contract signOff {

    mapping (address => bool) public signatories;
    address[] public required;
    address public admin;
    string public docHash;
    bool public isComplete;

    modifier onlyAdmin {
        if (msg.sender==admin)
        _
    }

    function () {
        throw;
    }

    function signOff(){
        admin=msg.sender;
    }

    function sign(){
        signatories[msg.sender]=true;
    }

    function setRequired(address _reqiredAddress) onlyAdmin {
        required.push(_reqiredAddress);
    }

    function setDocHash(string _docHash) onlyAdmin {
        docHash=_docHash;
    }

    function finalSignoff() onlyAdmin {
        for (uint i; i < required.length; i++){
            if (!signatories[required[i]])
                throw;
        }
        isComplete = true;
    }


}
