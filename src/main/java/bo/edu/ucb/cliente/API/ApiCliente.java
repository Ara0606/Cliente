package bo.edu.ucb.cliente.API;

import bo.edu.ucb.cliente.BL.ClienteBL;
import bo.edu.ucb.cliente.DTO.Cliente;
import bo.edu.ucb.cliente.DTO.Saldo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@RestController
public class ApiCliente {
    private ClienteBL clienteBL;

    @Autowired
    public ApiCliente(ClienteBL clienteBL) {
        this.clienteBL = clienteBL;
    }
    @PostMapping(value ="/cliente", consumes = MediaType.APPLICATION_JSON_VALUE)
    public String NewCliente(@RequestBody Cliente cliente){
        System.out.print(cliente.getFirst_name() + cliente.getLast_name()+ cliente.getGender()+cliente.getAge()+cliente.getAddress()+ cliente.getCard_card_id());
        return clienteBL.newClienteBL(cliente.getFirst_name(),cliente.getLast_name(),cliente.getGender(),cliente.getAge(),cliente.getAddress(), cliente.getCard_card_id());
    }
    @GetMapping(value = "/consulta_de_saldo",produces = MediaType.APPLICATION_JSON_VALUE)
    public  Integer consulta(@RequestParam int id){
        System.out.println("id");
        return clienteBL.ConsultaSaldo(id);
    }
    @PostMapping(value ="/retiro", consumes = MediaType.APPLICATION_JSON_VALUE)
    public String Retiro(@RequestBody Saldo saldo){
        return clienteBL.Retiro((int) saldo.getSaldo(),saldo.getClient_id());
    }
    @PostMapping(value ="/deposito", consumes = MediaType.APPLICATION_JSON_VALUE)
    public String Deposito(@RequestBody Saldo saldo){
        return clienteBL.Deposito((int) saldo.getSaldo(),saldo.getClient_id());
    }
}
