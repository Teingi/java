package com.mr.draw;

import java.awt.Canvas;
import java.awt.Graphics;
import java.awt.Image;

/**
 * 简笔画展示窗体
 * 
 * @开发单位 吉林省明日科技有限公司
 * @公司网址 www.mingribook.com
 */
public class DrawPictureCanvas extends Canvas {
	private Image image = null; // 创建画板中展示的图片对象

	/**
	 * 设置画板中的图片。
	 * 
	 * @param image
	 *            - 画板中展示的图片对象
	 */
	public void setImage(Image image) {
		this.image = image; // 为成员变量赋值
	}// setImage(Image image)结束

	/**
	 * 重写paint()方法，在画布上绘制图像。
	 */
	public void paint(Graphics g) {
		g.drawImage(image, 0, 0, null); // 在画布上绘制图像
	}// paint(Graphics g)结束

	/**
	 * 重写update()方法，这样可以解决屏幕闪耀的问题。
	 */
	public void update(Graphics g) {
		paint(g); // 调用paint方法
	}// update(Graphics g)结束

}// DrawPictureCanvas类结束