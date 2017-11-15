package test.redis.session;

public class User {
	private String email;
	private String name;
	private String password;
	private String a;
	private String b;
	public User(String email, String name, String password, String a, String b) {
		super();
		this.email = email;
		this.name = name;
		this.password = password;
		this.a = a;
		this.b = b;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getA() {
		return a;
	}
	public void setA(String a) {
		this.a = a;
	}
	public String getB() {
		return b;
	}
	public void setB(String b) {
		this.b = b;
	}
}
