package org.ifad.vasco.cronto;

import com.vasco.image.exception.ImageGeneratorSDKException;
import com.vasco.image.generator.ImageGeneratorSDK;
import org.apache.commons.codec.binary.Base64;

import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.IOException;

public class Main {
    public static void main(String[] args) throws IOException, ImageGeneratorSDKException {
        if (args.length != 1) {
            System.err.println("Usage: cronto <message>");
            System.exit(1);
        }

        try {
            String message = args[0];
            String image64 = generateCronto(message);
            System.out.println(image64);
        }
        catch (IOException e) {
            System.err.printf("IO Exception %s\n", e.getMessage());
            System.exit(-1);
        }
        catch (ImageGeneratorSDKException e) {
            System.err.printf("Onespan Image SDK Error %s\n", e.getErrorMessage());
            System.exit(-1);
        }
    }

    private static String generateCronto(String message) throws ImageGeneratorSDKException, IOException {
        BufferedImage cronto = ImageGeneratorSDK.generateCrontoSign(6, message);
        ByteArrayOutputStream buf = new ByteArrayOutputStream();
        ImageIO.write(cronto, "png", buf);
        buf.flush();
        byte[] image = buf.toByteArray();
        buf.close();
        return Base64.encodeBase64String(image);
    }
}
