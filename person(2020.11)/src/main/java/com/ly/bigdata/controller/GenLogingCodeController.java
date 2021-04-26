package com.ly.bigdata.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.Random;


@Controller
public class GenLogingCodeController {

@RequestMapping("/getpic")
@ResponseBody
public void  checkCode(HttpServletResponse response, HttpSession session) throws IOException {
    //生成验证码 awt/ swing 组件来生成的
    //创建返回的字节数组
    ByteArrayOutputStream output = new ByteArrayOutputStream();
    ServletOutputStream out = response.getOutputStream();
    //定义验证码的图片
    drawingCode(output, session);

    output.writeTo(out);

}

    public void drawingCode(ByteArrayOutputStream output,HttpSession session) throws IOException {
        //随机生成五个字符 包含 字母和 数字
        String code = "";
        for(int i=0;i<5;i++){
            code +=  randomChar();
        }

        int w = 100;//图片的宽度
        int h = 30;//图片的高度
        //定义好了画板
        BufferedImage image = new BufferedImage(w, h, BufferedImage.TYPE_INT_RGB);
        //得到画布 在画布上面 真正画东西
        Graphics g = image.getGraphics();
        g.setColor(Color.GREEN);//设定颜色
        g.fillRect(0, 0, w, h);//设定画布

        // 设定图片边框
        g.setColor(Color.GRAY);
        g.drawRect(0, 0, w - 1, h - 1);

        g.setColor(randomColor());//字体颜色
        g.setFont(randomFont());//字体样式
        g.drawString(code, 10, 22);
        g.dispose();

        //要把验证码放到 session范围中
        session.setAttribute("code", code);

        ImageIO.write(image, "jpg", output);

    }

    // 生成随机的字体
    private Font randomFont() {
        Random r = new Random();
        String[] fontNames = { "宋体", "华文楷体", "黑体", "微软雅黑", "楷体_GB2312" };
        int index = r.nextInt(fontNames.length);
        String fontName = fontNames[index];// 生成随机的字体名称
        int style = r.nextInt(4);
        int size = r.nextInt(3) + 24; // 生成随机字号, 24 ~ 28
        return new Font(fontName, style, size);
    }

    // 生成随机的颜色
    private Color randomColor() {
        Random r = new Random();
        int red = r.nextInt(150);
        int green = r.nextInt(150);
        int blue = r.nextInt(150);
        return new Color(red, green, blue);
    }

    public char randomChar(){
        Random r = new Random(); //0和O比较像  1 和 l  没有 0 1 数字 没有 O l字母
        String s = "23456789abcdefghjkmnopqrstuvwxyzABCDEFGHJKMNPQRSTUVWXYZ";
        int randomNum = r.nextInt(s.length());//0-s.length之间
        char c = s.charAt(randomNum);//c 就在 s 中的 随机一个字符
        return c;
    }

}
