<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix = "s" uri = "/struts-tags" %>

<!DOCTYPE html>
<body id="secMtu">

	<div id="wrap">
		<section id="container">
			<h1 class="skip">����ȸ�� ����</h1>
			<section class="content">
				<div class="modal modal-spinner" role="dialog" aria-hidden="true"
					style="display: none;"></div>
				<div class="contWrap ResumeMngCont">
					<div class="innerHd">
						<ul>
							<li class="hdTab"><a
								href="corppostlist.action">���� ����</a></li>
							<li class="on"><a
								href="applyList.action">������ ����</a></li>
						</ul>
					</div>

					<div class="tableList  ">
						<div class="">
							<div class="listSortArea">
								<div class="col col01">���� ����</div>
								<div class="col col02">���� ����</div>
							</div>
							<div class="mtuList">
								<ul>
									<!-- [����] �̷¼� �ۼ��� yet Ŭ���� �߰� -->
									<li class="ing">
										<div class="col col01">
											<div class="tit">
												<em class="badge">2018.12.19</em>
												<a href="./postbody/post.jsp" target="_blank">
													���� ����
												</a>
											</div>
											<div class="date"></div>
										</div>
										<div class="col col02">
											<!-- checkbox -->
											<div class="btnCell">
												<a class="btn" href="" target="_blank">����</a>
											</div>
											<div class="btnCell">
												<button class="btn" type="button" onclick="">
													<span>����</span>
												</button>
											</div>
										</div>
									</li>
								</ul>
							</div>
						</div>

						<div class="linkMng"></div>
						<!-- TIP -->
						<div id="devResumeEmail" name="devResumeEmail"
							style="position: absolute; top: 100px; left: 70px; z-index: 9999; display: none;">
							<iframe id="devResumeEmailIfrm" name="devResumeEmailIfrm"
								width="593" height="450" marginwidth="0" marginheight="0"
								frameborder="no" scrolling="no" title="�̷¼� �̸������� ���̾�"></iframe>
						</div>
					</div>



					<iframe id="frmFileDownload" style="display: none" title="�� ������"></iframe>
			</section>
			<hr />
			<section class="secLnb">
						<h1 class="skip">����ȸ�� ���� �޴�</h1>
						<div class="lnbGroup">
							<h2 class="lnbTit">���� �� ������ ����</h2>
							<ul>
								<li><a href="corppost.action"
									target="_blank">���� ���</a></li>
								<li><a href="corppostlist.action">��� ����
										����</a></li>
								<li><a href="corpresumelist.action">������
										����</a></li>
							</ul>
						</div>
						<hr/>
						<div class="lnbGroup">
							<h2 class="lnbTit">�������</h2>
							<ul>
								<li><a href="corphrsearch.action"
									target="_blank">���� �˻�</a></li>
							</ul>
						</div>
						<hr/>
						<div class="lnbGroup">
							<h2 class="lnbTit">ȸ������ ����</h2>
							<ul>
								<li><a href="corpinfo.action">������� ����</a></li>
								<li><a href="#">ȸ������ ����</a></li>
								<li><a href="#">ȸ��Ż��</a></li>
							</ul>
						</div>
					</section>
		</section>
	</div>