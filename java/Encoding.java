import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.nio.charset.Charset;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;

public class Encoding {
	
	// string -> sha256 -> base64 -> url encoding
	public static void main(String[] args) throws NoSuchAlgorithmException, UnsupportedEncodingException {
		
		Encoding en = new Encoding();
		
		byte[] result1 = en.getSHA256("test string".getBytes(Charset.forName("UTF-8")));
		en.print(result1);
		byte[] result2 = en.getBase64(result1);
		en.print(result2);
		
		String result3 = en.getUrlEncoding(result2);
		
		System.out.println("final result : " +result3);
	}
	
	public byte[] getSHA256(byte[] bytes) throws NoSuchAlgorithmException {

		MessageDigest sh = MessageDigest.getInstance("SHA-256");
		sh.update(bytes);
		
		return sh.digest();
	}
	
	public byte[] getBase64(byte[] bytes) {
		return Base64.getEncoder().encode(bytes);
	}
	
	public String getUrlEncoding(byte[] bytes) throws UnsupportedEncodingException {
		return URLEncoder.encode(new String(bytes), "UTF-8");
	}
	
	public void print(byte[] bytes) {
		for(byte b : bytes ) {
			//System.out.print(Integer.toBinaryString(b & 0xff) + " ");
			//System.out.print(Integer.toHexString(b & 0xff) + " ");
		}
		System.out.println();
		System.out.println(new String(bytes));
	}

}

