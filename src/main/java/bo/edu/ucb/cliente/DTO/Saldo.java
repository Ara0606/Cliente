package bo.edu.ucb.cliente.DTO;

public class Saldo {
    double saldo;
    int client_id;

    public Saldo() {
    }

    public double getSaldo() {
        return saldo;
    }

    public void setSaldo(double saldo) {
        this.saldo = saldo;
    }

    public int getClient_id() {
        return client_id;
    }

    public void setClient_id(int client_id) {
        this.client_id = client_id;
    }

    @Override
    public String toString() {
        return "Saldo{" +
                "saldo=" + saldo +
                ", client_id=" + client_id +
                '}';
    }
}
