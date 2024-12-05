package com.team2.danim.comm;

import java.util.List;
import java.util.Map;

import com.team2.danim.Criteria;
import com.team2.danim.Criteria2;

public interface CommMapper {
	public List<Comm_picture> getCommPicture();
	
	public List<Comm_picture> getCommPicturePaging(Criteria cri);

	public int getTotal();
	
	public int upload(Comm_picture cp);

	public List<Comm_picture> getCommPicture2(Comm_picture cp);

	public int delPicture(Comm_picture cp);

	public int updatePicture(Comm_picture cp);

	public List<Comm_picture> searchWriter(Map<String, String> map);

	public List<Comm_picture> searchTxt(Map<String, String> map);

	public int viewPlus(Comm_picture cp);

	public int goodPlus(Comm_picture cp);

	public int pictureReplyUpload(Comm_picture_reply cpr);

	public List<Comm_picture_reply> getReply(Comm_picture_reply cpr);

	public int delPictureReply(Comm_picture_reply cpr);


	public List<Comm_picture> getGoodPicture();


	public int goodPlusById(Comm_Picture_good cpg);



	public Comm_Picture_good goodCheck (Comm_Picture_good cpg);


	public int goodMinuById(Comm_Picture_good cpg);


	public int goodMinus(Comm_picture cp);


	public List<Comm_video> getCommVideo();


	public List<Comm_video> getGoodVideo();


	public int videoUpload(Comm_video cv);

	public int getSearchTotal(Comm_picture cp);

	public List<Comm_picture> searchTitle(Map<String, String> map);

	public int getSearchWriterTotal(Comm_picture cp);

	public int getSearchTxtTotal(Comm_picture cp);

	public List<Comm_video> getCommVideo2(Comm_video cv);

	public List<Comm_video> getCommVideoPaging(Criteria cri);

	public int getTotalVideo();

	public int getSearchTotalVideo(Comm_video cv);

	public int getSearchWriterTotalVideo(Comm_video cv);

	public int getSearchTxtTotalVideo(Comm_video cv);

	public List<Comm_video> searchTxtVideo(Map<String, String> map);

	public List<Comm_video> searchWriterVideo(Map<String, String> map);

	public List<Comm_video> searchTitleVideo(Map<String, String> map);

	public int delVideo(Comm_video cv);

	public int updateVideo(Comm_video cv);

	public int videoReplyUpload(Comm_Video_reply cvr);

	public List<Comm_Video_reply> getVideoReply(Comm_Video_reply cvr);

	public int delVideoReply(Comm_Video_reply cvr);

	public int goodVideoPlusById(Comm_Video_good cvg);

	public int goodVideoPlus(Comm_video cv);

	public Comm_Video_good goodVideoCheck(Comm_Video_good cvg);

	public int goodVideoMinuById(Comm_Video_good cvg);

	public int goodVideoMinus(Comm_video cv);

	public int viewVideoPlus(Comm_video cv);

	public int getFreeTotal();

	public List<Comm_free> getCommFreePaging(Criteria2 cri2);

	public int freeUpload(Comm_free cf);

	public int viewFreePlus(Comm_free cf);

	public Comm_free_good goodFreeCheck(Comm_free_good cfg);

	public List<Comm_free_reply> getFreeReply(Comm_free_reply cfr);

	public List<Comm_free> getCommFree2(Comm_free cf);

	public int delFree(Comm_free cf);

	public int updateFree(Comm_free cf);

	public int getSearchTotalFree(Comm_free cf);

	public List<Comm_free> searchTitleFree(Map<String, String> map);

	public int getSearchWriterTotalFree(Comm_free cf);

	public List<Comm_free> searchWriterFree(Map<String, String> map);

	public int getSearchTxtTotalFree(Comm_free cf);

	public List<Comm_free> searchTxtFree(Map<String, String> map);

	public int pictureReplyUpdate(Comm_picture_reply cpr);

	public int videoReplyUpdate(Comm_Video_reply cvr);

	public int freeReplyUpload(Comm_free_reply cfr);

	public int goodFreeMinuById(Comm_free_good cfg);

	public int goodFreeMinus(Comm_free cf);

	public int goodFreePlusById(Comm_free_good cfg);

	public int goodFreePlus(Comm_free cf);

	public int freeReplyUpdate(Comm_free_reply cfr);

	public int delFreeReply(Comm_free_reply cfr);

	public int importUpload(Comm_import ci);

	public List<Comm_import> getImport();

	public int viewImportPlus(Comm_import ci);

	public List<Comm_import_reply> getImportReply(Comm_import_reply cir);

	public List<Comm_import> getCommImport2(Comm_import ci);

	public int delImport(Comm_import ci);

}
