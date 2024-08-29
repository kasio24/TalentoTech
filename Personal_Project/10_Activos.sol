// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ActivoRegistro {
    // Asigna el Asset o Activo al Propietario del contrato
    mapping(uint256 => address) public Act_Owner;

    // Adicciona la direccion del contrato al activo
    address public Propietario_contrato;

    // Constructor para el propietario del contrato
    constructor() {
        Propietario_contrato = msg.sender; // Despliega el propietario
    }

    // Solo el propietario del activo puede modificarlo
    modifier Uni_Owner() {
        require(msg.sender == Propietario_contrato, "Unicamente el propietario puede modificar el contrato");
        _;
    }

    // Function crear nuevo Activo (solo puede ser cambiado por el propietario)
    function reg_Activo(uint256 Id_Activo) public Uni_Owner {
        require(Act_Owner[Id_Activo] == address(0), "Activo se encuentra registrado");
        Act_Owner[Id_Activo] = msg.sender;
    }

    // Function para transferir el activo
    function trans_Activo(uint256 Id_Activo, address newOwner) public  {
        require(Act_Owner[Id_Activo] == msg.sender, "Usted no es el propietario de este Activo");
        require(newOwner != address(0), "Billetera errada para el nuevo propietario");
        Act_Owner[Id_Activo] = newOwner;
    }

    // Function para revisar quien es el propietario del Activo
    function Revisar(uint256 Id_Activo) public view returns (address) {
        return Act_Owner[Id_Activo];
    }
}
