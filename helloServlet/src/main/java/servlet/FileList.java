package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import fileupload.FileDao;
import fileupload.FileDto;

/**
 * Servlet implementation class FileList
 */
// WebServelt(폴더경로)
@WebServlet("/12파일업로드/FileList")
public class FileList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FileList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest req, HttpServletResponse response) throws ServletException, IOException {

		
		FileDao dao = new FileDao();
		List<FileDto> list = dao.getFileList();
		// System.out.print("총건수 : " + list.size());
		req.setAttribute("list", list);
		
		
		// 경로가 중요합니다. 잘 매핑 시켜줘야해요
		req.getRequestDispatcher("./FileList.jsp").forward(req, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
