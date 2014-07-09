package com.Coin;

public class MemberDTO {
          private String seq;
          private String name;
          private String id;
          public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
		public String getId() {
			return id;
		}
		public void setId(String id) {
			this.id = id;
		}
		private String coin;
          
		public String getSeq() {
			return seq;
		}
		public void setSeq(String seq) {
			this.seq = seq;
		}
		public String getCoin() {
			return coin;
		}
		public void setCoin(String coin) {
			this.coin = coin;
		}
          
}
