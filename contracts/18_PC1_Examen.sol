// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

import "hardhat/console.sol";

contract Elecciones256985 {
    
    struct Acta {
        uint256 id;
        string centroVotacion;
        uint256 votosValidos;
        bool observada;
        bool estado;
    }

    Acta[] public actas;

    uint256 public posicion;
    address public direccion;

    constructor(uint256 _posicion) {
        posicion = _posicion;
        direccion = msg.sender;
    }

    function agregarElemento(uint256 _id, string memory _centroVotacion, uint256 _votosValidos, bool _observada, bool _estado) public {
        require(_id % 2 == 0, "No se permiten IDs impares");
        actas.push(Acta(_id, _centroVotacion, _votosValidos, _observada, _estado));
    }

    function contarElementos() public view returns (uint256) {
        return actas.length;
    }

    function cambiarDireccion(address _nuevaDireccion) public {
        direccion = _nuevaDireccion;
    }

    function pintarActivos() external view {
        for(uint i=0; i < actas.length; i++) {
            if(actas[i].estado == true) {
                console.log("Acta activa:", actas[i].id, actas[i].centroVotacion);
            }
        }
    }

    function inactivarActa(uint256 _id) public {
        for(uint i=0; i < actas.length; i++) {
            if(actas[i].id == _id) {
                actas[i].estado = false;
            }
        }
    }
}