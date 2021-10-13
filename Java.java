package test;
import java.io.File;
import java.io.FileWriter;
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
public class Test {
	 public static void main(String[] args) throws Exception{
	        long start = System.currentTimeMillis();
	        int[][] mat = init();
	        System.out.println(System.currentTimeMillis() - start);
	        start = System.currentTimeMillis();
	        sort(mat);
	        resolve(mat);
	        System.out.println((System.currentTimeMillis() - start)+ "ms");
	        
	    }
        //最终生成邻胞矩阵
	    private static int[][] resolve(int[][] mat) throws IOException{
	    	int lbjz[][]=new int[65057][4];//每次都更改
	    	for(int i = 0; i < mat.length; i++){
	    		int lb=0;	    	
	            for(int j = i + 1; j < mat.length; j++){
	            	int lbl=3;
	            	int[] a1 = mat[i];
	            	int[] a2 = mat[j];
	                if(match(a1, a2)){     //判断有三个相同元素后	                
	                	lbjz[i][lb]=j+1;
	                	while(lbjz[j][lbl]!=0) lbl--;//防止后来的数据覆盖前面的
	                	lbjz[j][lbl]=i+1;	               
	                    lb++;
	                } 
	    
	            }
	           
	        }
	    	for(int i=0;i<lbjz.length;i++){
	    		   for(int j=0;j<4;j++){
	    		    System.out.print(lbjz[i][j]+"\t");
	    		   }
	    		   System.out.println();
	    		  }
	    	  
	        return null;
	    }

	    //读入二维数组
	        public static  int[][] init() throws Exception  {

	          // TODO Auto-generated method stub

	         

	 		 FileReader fr=new FileReader("D:\\b.txt");

	 	        //可以换成工程目录下的其他文本文件

	 	        BufferedReader br=new BufferedReader(fr);

	 	        String line = null; 
	 	        
	 	        int x=0;
	 	        
	 	        int[][] mat=new int[65057][4] ; // 每次都更改

	 	        int ind = 0; 

	 	        String[] sp; 

	 	        float[] lineMat; 

	 	        while((line=br.readLine())!=null){

	 	        sp = line.split("	"); //将mat文件复制到txt后数据间默认是一个tab的距离

	 	        lineMat = new float[sp.length]; 

	 	        for(int j=0,l=sp.length;j<l;++j){ //l=4因为sp分出了四个字符

	 	        	 lineMat[j] = Float.parseFloat(sp[j]); 
	 	        	
	 	          //System.out.println(lineArray[j]);

	 	        	//System.out.print(lineMat[j]+" ");//这种输出方式使输出数据后不换行

	 	        	mat[x][j]=Integer.parseInt(sp[j]);

	 	        }
	             x++;
	 	        System.out.println("\n");

	 	        //	System.out.println(line);
	 	        	        
	 	       } 
	 	       return mat;
	 	   //     array[ind++] = lineArray;      
	 		 }
	 


	    //判断两个排好序的数组是否含有3个相同元素
	private static boolean match(int[] a1, int[] a2) {
	        int c = 0;
	        for(int p = 0, q = 0; p < a1.length && q< a2.length;){
	            if(a1[p] > a2[q]){
	                q++;
	            }else if (a1[p] < a2[q]){
	                p++;
	            }else {
	                if((++c) == 3){
	                    return true;
	                }
	                p++; q++;
	            }
	        }
	        return false;
	    }
	//对二维数组的每一行按从小到大排序
	    private static void sort(int[][] mat){
	        for(int i = 0; i < mat.length; i++){
	            mat[i] = sort(mat[i]);
	        }
	    }

	    private static int[] sort(int[] arr){
	        for(int i = 0; i < arr.length; i++){
	            for(int j = i + 1; j < arr.length; j++){
	                if(arr[i] > arr[j]){
	                    int tmp = arr[i];
	                    arr[i] = arr[j];
	                    arr[j] = tmp;
	                }
	            }
	        }
	        return arr;
	    }

	    private static void print(int[] arr){
	        for(int i = 0; i < arr.length; i++){
	            System.out.print(arr[i] + " ");
	        }
	        System.out.println();
	    }

}
