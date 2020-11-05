package board.model.service;

import java.sql.Connection;
import java.util.List;
import com.dao.BoardDao;
import com.dto.BoardDto;
import static common.JDBCTemplate.*;

public class BoardService {
		private BoardDao boardDao = new BoardDao();
		
		public int selectBoardCount() {
			Connection conn = getConnection();
			int totalBoardCount = new BoardDao().selectBoardCount(conn);
			close(conn);
			return totalBoardCount;
		}
		
		public List<BoardDto> selectBoardList(int cPage, int numPerPage){
			Connection conn = getConnection();
			List<BoardDto> list = new BoardDao().selectBoardList(conn, cPage, numPerPage);
			close(conn);
			return list;
		}
		
		public int selectBoardCountF() {
			Connection conn = getConnection();
			int totalBoardCount = new BoardDao().selectBoardCountF(conn);
			close(conn);
			return totalBoardCount;
		}
		
		public List<BoardDto> selectBoardListF(int cPage, int numPerPage){
			Connection conn = getConnection();
			List<BoardDto> list = new BoardDao().selectBoardListF(conn, cPage, numPerPage);
			close(conn);
			return list;
		}
		
		public int selectBoardCountE() {
			Connection conn = getConnection();
			int totalBoardCount = new BoardDao().selectBoardCountE(conn);
			close(conn);
			return totalBoardCount;
		}
		
		public List<BoardDto> selectBoardListE(int cPage, int numPerPage){
			Connection conn = getConnection();
			List<BoardDto> list = new BoardDao().selectBoardListE(conn, cPage, numPerPage);
			close(conn);
			return list;
		}
	}
