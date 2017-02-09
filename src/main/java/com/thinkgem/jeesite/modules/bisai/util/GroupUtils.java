package com.thinkgem.jeesite.modules.bisai.util;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class GroupUtils {

	static class BiSai {
		private String player1;
		private String player2;
		private List<List<Integer>> game;

		public String getPlayer1() {
			return player1;
		}

		public void setPlayer1(String player1) {
			this.player1 = player1;
		}

		public String getPlayer2() {
			return player2;
		}

		public void setPlayer2(String player2) {
			this.player2 = player2;
		}

		public List<List<Integer>> getGame() {
			return game;
		}

		public void setGame(List<List<Integer>> game) {
			this.game = game;
		}

	}

	static class JieGuo {
		private String player;
		private int shengchang;
		private int shengju;
		private int shengqiu;

		public String getPlayer() {
			return player;
		}

		public void setPlayer(String player) {
			this.player = player;
		}

		public int getShengchang() {
			return shengchang;
		}

		public void setShengchang(int shengchang) {
			this.shengchang = shengchang;
		}

		public int getShengju() {
			return shengju;
		}

		public void setShengju(int shengju) {
			this.shengju = shengju;
		}

		public int getShengqiu() {
			return shengqiu;
		}

		public void setShengqiu(int shengqiu) {
			this.shengqiu = shengqiu;
		}
	}

	// 生成比分集合，用于生成测试数据
	public static List<Integer> bifen(int bifen1, int bifen2) {
		List<Integer> cj = new ArrayList<Integer>();
		cj.add(bifen1);
		cj.add(bifen2);
		return cj;

	}

	// 生成比赛用于生成测试数据
	public static BiSai name(String name1, String name2, int bifen1,
			int bifen2, int bifen3, int bifen4, int bifen5, int bifen6) {
		List<List<Integer>> sai = new ArrayList<List<Integer>>();
		List<Integer> cj1 = bifen(bifen1, bifen2);
		List<Integer> cj2 = bifen(bifen3, bifen4);
		List<Integer> cj3 = bifen(bifen5, bifen6);

		sai.add(cj1);
		sai.add(cj2);
		sai.add(cj3);
		BiSai BiSai = new BiSai();
		BiSai.setPlayer1(name1);
		BiSai.setPlayer2(name2);
		BiSai.setGame(sai);
		return BiSai;
	}

	// -------------------方法开始-----------------------------
	/**
	 * 数组方式查重
	 * 
	 * @param str
	 * @return如果有重复的人返回0没有返回数组
	 */
	public static Object findupl(String[] str) {
		for (int i = 0; i < str.length; i++) {
			Object obji = str[i];
			for (int y = i + 1; y < str.length; y++) {
				if (obji.equals(str[y])) {
					return "0";
				}
			}
		}
		return str;
	}

	/**
	 * 判断集合中是否有重复对象
	 * 
	 * @param str
	 * @return“0”有重复，无重复的时候返回集合
	 * 
	 */
	public static <T> Object findupl(List<T> str) {
		for (int i = 0; i < str.size(); i++) {
			T obji = str.get(i);
			for (int y = i + 1; y < str.size(); y++) {
				if (obji.equals(str.get(y))) {
					return "0";
				}
			}
		}
		return str;
	}

	/***
	 * 分组当分成两组的时候剩下的一个人甩着，分成其他组剩下的人插队。
	 * 
	 * @param str
	 *            报名人数集合
	 * @param rz
	 *            分成几组
	 * @param pai
	 *            0：随机分组1：按正序分组。
	 * @return 分组后的集合
	 */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public static <T> Object fenzu(List<T> str, int rz, String pai) {
		if (findupl(str) == "0") {
			return "0";
		}
		if (pai == "0") {
			Collections.shuffle(str);
		}
		ArrayList<ArrayList> xinfen = new ArrayList<ArrayList>();
		ArrayList<T> linshi = new ArrayList<T>();
		int a = str.size();
		int n = 0;
		int x = a % rz;
		for (int i = 0; i < str.size(); i++) {
			linshi.add(str.get(i));
			n = n + 1;
			if (n % rz == 0) {
				xinfen.add(linshi);
				linshi = new ArrayList<T>();
			}
			if (rz == 2 && x == 1 && i + 1 == a) {

				xinfen.add(linshi);
				// xinfen.add(str.get(i));
				x = 0;
			}
		}
		n = 0;
		a = xinfen.size();
		while (x > 0) {
			int y = str.size() - x;
			xinfen.get(n).add(str.get(y));
			x = x - 1;
			if ((n + 1 >= a)) {
				n = 0;
			} else {
				n = n + 1;
			}
		}

		return xinfen;
	}

	/**
	 * 单场结果
	 * @param list
	 * @return
	 */
	public static List<Integer> dansy(List<Integer> list) {
		List<Integer> str = new ArrayList<Integer>();
		if (list.get(0) == list.get(1)) {
			str.add(0);
		} else {
			if (list.get(0) > list.get(1)) {
				str.add(1);
			} else {
				str.add(-1);
			}
		}
		str.add(list.get(0) - list.get(1));
		return str;
	}
	
	/**
	 * 单局结果
	 * @param list
	 * @return
	 */
	public static List<Integer> danju(List<List<Integer>> list) {
		List<Integer> str = new ArrayList<Integer>();
		int jingju = 0;
		int jingfen = 0;
		for (List<Integer> listt : list) {
			jingju = jingju + dansy(listt).get(0);
			jingfen = jingfen + dansy(listt).get(1);
		}
		str.add(jingju);
		str.add(jingfen);
		if (str.get(0) > 0) {
			str.add(1);
		} else {
			str.add(0);
		}
		return str;
	}

	/**
	 * 比赛分数结果
	 * @param biSais
	 * @param in
	 * @return
	 */
	public static List<JieGuo> sfis(List<BiSai> biSais,int in) {
		List<JieGuo> JieGuos = new ArrayList<JieGuo>();
		int num = biSais.size();
		String[] winners = new String[num];
		for (int i = 0; i < num; i++) {
			BiSai BiSai = biSais.get(i);
			List<Integer> danjuJieGuo = danju(BiSai.getGame());
			JieGuo JieGuo = new JieGuo();
			JieGuo.setPlayer(BiSai.getPlayer1());
			JieGuo.setShengchang(danjuJieGuo.get(0));
			JieGuo.setShengqiu(danjuJieGuo.get(1));
			JieGuos.add(JieGuo);
			JieGuo = new JieGuo();
			JieGuo.setPlayer(BiSai.getPlayer2());
			JieGuo.setShengchang(-danjuJieGuo.get(0));
			JieGuo.setShengqiu(-danjuJieGuo.get(1));
			JieGuos.add(JieGuo);

			if (danjuJieGuo.get(2) == 1) {
				winners[i] = BiSai.getPlayer1();
			} else {
				winners[i] = BiSai.getPlayer2();
			}
		}

		List<String> players = new ArrayList<String>();
		for (int i = 0; i < winners.length; i++) {
			Boolean bl = true;
			String winner = winners[i];
			if (players.size() != 0) {
				for (int j = 0; j < players.size(); j++) {
					String player = players.get(j);
					if (winner.equals(player)) {
						bl = false;
					}
				}
			} else {
				players.add(winner);
				bl = false;
			}
			if (bl) {
				players.add(winner);
			}
		}
		int playnum = players.size();
		Integer[] shengchang = new Integer[playnum];
		for (int i = 0; i < playnum; i++) {
			shengchang[i] = 0;
			for (String winner : winners) {
				if (players.get(i).equals(winner)) {
					shengchang[i] = shengchang[i] + 1;
				}
			}
		}
		Integer[] shengju = new Integer[playnum];
		Integer[] shengqiu = new Integer[playnum];
		for (int i = 0; i < playnum; i++) {
			shengju[i] = 0;
			shengqiu[i] = 0;
			for (JieGuo JieGuo : JieGuos) {
				if (JieGuo.getPlayer().equals(players.get(i))) {
					shengju[i] = shengju[i] + JieGuo.getShengchang();
					shengqiu[i] = shengqiu[i] + JieGuo.getShengqiu();
				}
			}
		}

		List<JieGuo> JieGuos2 = new ArrayList<JieGuo>();
		for (int i = 0; i < playnum; i++) {
			JieGuo JieGuo = new JieGuo();
			JieGuo.setPlayer(players.get(i));
			JieGuo.setShengchang(shengchang[i]);
			JieGuo.setShengju(shengju[i]);
			JieGuo.setShengqiu(shengqiu[i]);
			JieGuos2.add(JieGuo);
		}
		List<JieGuo> paixu = paixu(JieGuos2);
		int n = paixu.size();
		for (int i = 0; i < n; i++) {
			if (i + 1 < n) {
				if (paixu.get(i).getShengchang() != paixu.get(i + 1)
						.getShengchang()) {
					continue;
				} else {
					if (i + 2 < n) {
						if (!(paixu.get(i + 2).getShengchang() == paixu.get(
								i + 1).getShengchang() && paixu.get(i + 1)
								.getShengchang() == paixu.get(i)
								.getShengchang())) {
							for (int j = 0; j < biSais.size(); j++) {
								if ((biSais.get(j).getPlayer1().equals(paixu.get(i).getPlayer())||biSais.get(j).getPlayer1().equals(paixu.get(i+1).getPlayer()))&&
									(biSais.get(j).getPlayer2().equals(paixu.get(i).getPlayer())||biSais.get(j).getPlayer2().equals(paixu.get(i+1).getPlayer()))) {
									if (winners[j].equals(paixu.get(i+1).getPlayer())) {
										String a = paixu.get(i).getPlayer();
										int b = paixu.get(i).getShengchang();
										int c = paixu.get(i).getShengju();
										int d = paixu.get(i).getShengqiu();
										paixu.get(i).setPlayer(paixu.get(i+1).getPlayer());
										paixu.get(i).setShengchang(paixu.get(i+1).getShengchang());
										paixu.get(i).setShengju(paixu.get(i+1).getShengju());
										paixu.get(i).setShengqiu(paixu.get(i+1).getShengqiu());
										paixu.get(i+1).setPlayer(a);
										paixu.get(i+1).setShengchang(b);
										paixu.get(i+1).setShengju(c);
										paixu.get(i+1).setShengqiu(d);
									}
								}
							}
						}
					}
				}
			}
		}
		if(in==0){
			in=n;
		}
		List<JieGuo> subList = paixu.subList(0, in);
		return subList;
	}

	/**
	 * 需要排序的集合按胜场胜局胜球顺序降序排列
	 * @param list
	 */
	public static List<JieGuo> paixu(List<JieGuo> list) {
		
		for (int i = 0; i < list.size(); i++) {
			for (int y = i + 1; y < list.size(); y++) {
				int shengchang = list.get(i).getShengchang();
				int shengju = list.get(i).getShengju();
				int shengqiu = list.get(i).getShengqiu();
				int shengchangy = list.get(y).getShengchang();
				int shengjuy = list.get(y).getShengju();
				int shengqiuy = list.get(y).getShengqiu();
				if (shengchang < shengchangy) {
					String a = list.get(i).getPlayer();
					int b = list.get(i).getShengchang();
					int c = list.get(i).getShengju();
					int d = list.get(i).getShengqiu();
					list.get(i).setPlayer(list.get(y).getPlayer());
					list.get(i).setShengchang(list.get(y).getShengchang());
					list.get(i).setShengju(list.get(y).getShengju());
					list.get(i).setShengqiu(list.get(y).getShengqiu());
					list.get(y).setPlayer(a);
					list.get(y).setShengchang(b);
					list.get(y).setShengju(c);
					list.get(y).setShengqiu(d);

				} else if (shengchang == shengchangy) {

					if (shengju < shengjuy) {
						String a = list.get(i).getPlayer();
						int b = list.get(i).getShengchang();
						int c = list.get(i).getShengju();
						int d = list.get(i).getShengqiu();
						list.get(i).setPlayer(list.get(y).getPlayer());
						list.get(i).setShengchang(list.get(y).getShengchang());
						list.get(i).setShengju(list.get(y).getShengju());
						list.get(i).setShengqiu(list.get(y).getShengqiu());
						list.get(y).setPlayer(a);
						list.get(y).setShengchang(b);
						list.get(y).setShengju(c);
						list.get(y).setShengqiu(d);
					} else if (shengju == shengjuy) {
						if (shengqiu < shengqiuy) {
							String a = list.get(i).getPlayer();
							int b = list.get(i).getShengchang();
							int c = list.get(i).getShengju();
							int d = list.get(i).getShengqiu();
							list.get(i).setPlayer(list.get(y).getPlayer());
							list.get(i).setShengchang(
									list.get(y).getShengchang());
							list.get(i).setShengju(list.get(y).getShengju());
							list.get(i).setShengqiu(list.get(y).getShengqiu());
							list.get(y).setPlayer(a);
							list.get(y).setShengchang(b);
							list.get(y).setShengju(c);
							list.get(y).setShengqiu(d);
						}
					}
				}
			}

		}
		return list;
	}
	/**
	 * 比赛分组
	 * @param list
	 * @return
	 */
	public static List<List<String[]>> BiSaifenzu(List<String[]> list) {
		List<List<String[]>> strs=new ArrayList<List<String[]>>();
		for (String[] strings : list) {
			List<String[]> listt=new ArrayList<String[]>();
			for (int i = 0; i < strings.length; i++) {
				for (int j = i+1; j < strings.length; j++) {
					String[] BiSai=new String[2];
					BiSai[0]=strings[i];
					BiSai[1]=strings[j];
					listt.add(BiSai);
				}
			}
			strs.add(listt);
		}
		return strs;
	}

	// -------------------------------方法结束,下面为主函数测试-------------------------------------------------
	public static void main(String[] args) {
		List<String[]> list=new ArrayList<String[]>();
		String[] str=new String[]{"1","2","3","10"};
		list.add(str);
		str=new String[]{"4","5","6","11"};
		list.add(str);
		str=new String[]{"7","8","9"};
		list.add(str);
		List<List<String[]>> JieGuo=BiSaifenzu(list);
		int num=0;
		int numm=0;
		for (List<String[]> listt : JieGuo) {
			num=num+1;
			System.out.println("第 "+num+" 组:");
			for (String[] strings : listt) {
				numm=numm+1;
				System.out.println("      第 "+numm+" 场:"+strings[0]+"   对战    "+strings[1]);
			}
		}
		/**===================================================*/
		String[] shuzu = new String[] { "xiaochen", "xiaocao", "xiaoxu" };
		ArrayList<String> arrayList = new ArrayList<String>();
		ArrayList<String> ren = new ArrayList<String>();
		ArrayList<String> fenshu = new ArrayList<String>();
		arrayList.add("1");
		arrayList.add("2");
		arrayList.add("3");
		arrayList.add("4");
		arrayList.add("5");
		arrayList.add("6");
		arrayList.add("7");
		arrayList.add("8");
		arrayList.add("9");
		arrayList.add("10");
		arrayList.add("11");
		arrayList.add("12");

		System.out.println(findupl(shuzu));
		System.out.println(findupl(arrayList));
		System.out.println(fenzu(arrayList,4,"1"));
		/**===================================================*/
		List<BiSai> biSais = new ArrayList<BiSai>();
		BiSai BiSai = name("a", "b", 19, 21, 21, 18, 11, 21);
		biSais.add(BiSai);
		BiSai = name("a", "c", 15, 21, 21, 18, 21, 15);
		biSais.add(BiSai);
		BiSai = name("a", "d", 19, 21, 21, 15, 21, 13);
		biSais.add(BiSai);
		BiSai = name("a", "e", 21, 18, 21, 19, 0, 0);
		biSais.add(BiSai);
		BiSai = name("a", "f", 21, 17, 21, 18, 0, 0);
		biSais.add(BiSai);
		BiSai = name("a", "g", 18, 21, 21, 17, 21, 19);
		biSais.add(BiSai);
		BiSai = name("b", "c", 18, 21, 21, 15, 21, 18);
		biSais.add(BiSai);
		BiSai = name("b", "d", 17, 21, 21, 18, 16, 21);
		biSais.add(BiSai);
		BiSai = name("b", "e", 10, 21, 8, 21, 0, 0);
		biSais.add(BiSai);
		BiSai = name("b", "f", 25, 24, 15, 21, 21, 18);
		biSais.add(BiSai);
		BiSai = name("b", "g", 18, 21, 21, 18, 21, 19);
		biSais.add(BiSai);
		BiSai = name("c", "d", 22, 24, 19, 21, 0, 0);
		biSais.add(BiSai);
		BiSai = name("c", "e", 17, 21, 19, 21, 0, 0);
		biSais.add(BiSai);
		BiSai = name("c", "f", 21, 16, 19, 21, 21, 16);
		biSais.add(BiSai);
		BiSai = name("c", "g", 19, 21, 21, 15, 18, 21);
		biSais.add(BiSai);
		BiSai = name("d", "e", 20, 22, 21, 16, 21, 18);
		biSais.add(BiSai);
		BiSai = name("d", "f", 21, 16, 17, 21, 21, 15);
		biSais.add(BiSai);
		BiSai = name("d", "g", 21, 15, 21, 13, 0, 0);
		biSais.add(BiSai);
		BiSai = name("e", "f", 10, 21, 21, 18, 21, 16);
		biSais.add(BiSai);
		BiSai = name("e", "g", 19, 21, 21, 15, 21, 13);
		biSais.add(BiSai);
		BiSai = name("f", "g", 17, 21, 21, 17, 21, 18);
		biSais.add(BiSai);

		
	
		List<JieGuo> JieGuos = sfis(biSais,3);
		 for (JieGuo JieGuo2 : JieGuos) {
		 System.out.print(JieGuo2.getPlayer()+"|");
		 System.out.print(JieGuo2.getShengchang()+"|");
		 System.out.print(JieGuo2.getShengju()+"|");
		 System.out.println(JieGuo2.getShengqiu());
		 }
		List<JieGuo> paixu = paixu(JieGuos);
		 System.out.println("排序后：");
		 for (JieGuo JieGuo1 : paixu) {
		 System.out.print(JieGuo1.getPlayer()+"|");
		 System.out.print(JieGuo1.getShengchang()+"|");
		 System.out.print(JieGuo1.getShengju()+"|");
		 System.out.println(JieGuo1.getShengqiu());
		 }
	}

	
}
