package com.fs.model.vo;

import java.sql.Date;

public class Member {
   private int memberNo;
   private String memberId;
   private String memberPw;
   private String memberName;
   private String phone;
   private String email;
   private Date bDay;
   private Date joinDate;
   private String quitYn;
   private String managerYn;
   
   public Member() {
      // TODO Auto-generated constructor stub
   }

   public Member(int memberNo, String memberId, String memberPw, String memberName, String phone, String email,
         Date bDay, Date joinDate, String quitYn, String managerYn) {
      super();
      this.memberNo = memberNo;
      this.memberId = memberId;
      this.memberPw = memberPw;
      this.memberName = memberName;
      this.phone = phone;
      this.email = email;
      this.bDay = bDay;
      this.joinDate = joinDate;
      this.quitYn = quitYn;
      this.managerYn = managerYn;
   }

   public int getMemberNo() {
      return memberNo;
   }

   public void setMemberNo(int memberNo) {
      this.memberNo = memberNo;
   }

   public String getMemberId() {
      return memberId;
   }

   public void setMemberId(String memberId) {
      this.memberId = memberId;
   }

   public String getMemberPw() {
      return memberPw;
   }

   public void setMemberPw(String memberPw) {
      this.memberPw = memberPw;
   }

   public String getMemberName() {
      return memberName;
   }

   public void setMemberName(String memberName) {
      this.memberName = memberName;
   }

   public String getPhone() {
      return phone;
   }

   public void setPhone(String phone) {
      this.phone = phone;
   }

   public String getEmail() {
      return email;
   }

   public void setEmail(String email) {
      this.email = email;
   }

   public Date getbDay() {
      return bDay;
   }

   public void setbDay(Date bDay) {
      this.bDay = bDay;
   }

   public Date getJoinDate() {
      return joinDate;
   }

   public void setJoinDate(Date joinDate) {
      this.joinDate = joinDate;
   }

   public String getQuitYn() {
      return quitYn;
   }

   public void setQuitYn(String quitYn) {
      this.quitYn = quitYn;
   }

   public String getManagerYn() {
      return managerYn;
   }

   public void setManagerYn(String managerYn) {
      this.managerYn = managerYn;
   }

   @Override
   public String toString() {
      return "Member [memberNo=" + memberNo + ", memberId=" + memberId + ", memberPw=" + memberPw + ", memberName="
            + memberName + ", phone=" + phone + ", email=" + email + ", bDay=" + bDay + ", joinDate=" + joinDate
            + ", quitYn=" + quitYn + ", managerYn=" + managerYn + "]";
   }
   
   
}